output "vpc_id" {
  value = module.networking.vpc_id
}

output "instance_ids" {
  value = module.compute.instance_ids
}

output "bucket_name" {
  value = module.storage.bucket_name
}
