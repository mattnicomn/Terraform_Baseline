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
}

module "networking" {
  source = "./modules/networking"
}

module "iam" {
  source = "./modules/iam"
}

module "compute" {
  source = "./modules/compute"
}

module "storage" {
  source = "./modules/storage"
}

