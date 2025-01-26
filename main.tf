terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "networking" {
  source = "./modules/networking"
}

module "iam" {
  source = "./modules/iam"
}

module "compute" {
  source = "./modules/compute"
  vpc_id = module.networking.vpc_id
#  subnet_id = module.networking.subnet_id
  subnet_ids = module.networking.subnet_ids[0] # Get the first subnet ID
}

module "storage" {
  source = "./modules/storage"
}

