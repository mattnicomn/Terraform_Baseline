output "vpc_id" {
  value = module.networking.vpc_id
}

output "iam_roles" {
  value = module.iam.roles
}

output "ec2_instance_ids" {
  value = module.compute.instance_ids
}

output "s3_bucket_name" {
  value = module.storage.bucket_name
}

output "ami_id" {
  value = data.aws_ssm_parameter.latest_ami.value
  description = "The AMI ID used for instances"
}