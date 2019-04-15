variable "aws-region" {
  type        = "string"
  description = "AWS region to use"
  default     = "eu-central-1"
}

variable "buckets-name-prefix" {
  type        = "string"
  description = "The prefix for the S3 buckets for all environments"
  default     = "tf-cicd-demo"
}

variable "env-designations" {
  type        = "list"
  description = "Environmetn designations"
  default     = ["prod", "st"]
}

variable "iam-username" {
  type        = "string"
  description = "Name of the user with deploy access"
  default     = "tf-travis-deploy-s3"
}
