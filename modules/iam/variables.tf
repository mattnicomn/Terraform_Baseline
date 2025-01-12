variable "role_names" {
  description = "List of IAM role names"
  type        = list(string)
  default     = ["role1", "role2"]
}
