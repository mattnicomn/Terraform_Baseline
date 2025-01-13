variable "ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-0c55b159cbfafe1f0" # Example AMI ID
}

variable "instance_types" {
  description = "List of instance types"
  type        = list(string)
  default     = ["t2.micro", "t2.micro"]
}

variable "subnet_id" {
  description = "Subnet ID to deploy instances"
  type        = string
  default     = null # Makes it optional
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
  default     = null # Makes it optional
}

variable "security_group_name" {
  description = "Name of the security group"
  type        = string
  default     = "compute-sg"
}

variable "allowed_ssh_cidrs" {
  description = "List of CIDR blocks allowed to SSH into the instances"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default     = {
    Environment = "dev"
    ManagedBy   = "Terraform"
  }
}

