resource "aws_instance" "instances" {
  count         = length(var.instance_types)
  ami           = var.ami_id
  instance_type = var.instance_types[count.index]
  subnet_id     = var.subnet_ids
  key_name      = var.key_name

  tags = merge(
    var.common_tags,
    {
      Name = "AI-Bot-Instance-${count.index}"
    }
  )

  user_data = <<-EOF
    #!/bin/bash
    apt-get update -y
    apt-get install -y python3 python3-pip
    # Add script to run the bot
    echo "#!/bin/bash
    python3 /home/ubuntu/trading_bot.py" > /home/ubuntu/start_bot.sh
    chmod +x /home/ubuntu/start_bot.sh
  EOF
}
/*
    pip3 install openai robin_stocks requests pandas
    echo "export OPENAI_API_KEY=${var.openai_api_key}" >> /etc/environment
    echo "export ROBINHOOD_USERNAME=${var.robinhood_username}" >> /etc/environment
    echo "export ROBINHOOD_PASSWORD=${var.robinhood_password}" >> /etc/environment
*/
resource "aws_security_group" "compute_sg" {
  name        = var.security_group_name
  vpc_id      = var.vpc_id
  description = "Security group for compute instances"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidrs
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.common_tags,
    {
      Name = "Compute-Security-Group"
    }
  )
}

data "aws_ssm_parameter" "latest_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}
