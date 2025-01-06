module "networking" {
  source = "../../modules/networking"
  azs    = ["us-east-1a", "us-east-1b"]
}

module "iam" {
  source = "../../modules/iam"
}
