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

