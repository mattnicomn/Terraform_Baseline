resource "aws_instance" "bot" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.public_subnet_ids[0]
  iam_instance_profile   = var.iam_instance_profile

  tags = {
    Name = "openai-bot-instance"
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y python3-pip
              pip3 install openai robin_stocks
              # Add script to execute OpenAI bot here
              EOF
}

output "instance_public_ip" {
  value = aws_instance.bot.public_ip
}
