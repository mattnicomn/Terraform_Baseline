variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidrs" {
  description = "List of subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24, 10.0.3.0/24"]
}

#variable "vpc_id" {
#  description = "VPC ID for the security group"
#  type        = string
#  default     = null # Makes it optional
#}

variable "aws_availability_zones" {
  description = "List of AWS availability zones to use for the networking module"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "cidr_block" {
  description = "List of subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}