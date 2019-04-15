terraform {
  backend "s3" {
    bucket = "tf-remote-states-srd"
    key    = "tf-cicd-demo/terraform.tfstate"
    region = "eu-central-1"
  }
}

provider "aws" {
  region = "${var.aws-region}"
}
