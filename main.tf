terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"

  backend "s3" {
    bucket = "sd-makers-tf-state"
    key    = "task_list/env/prod/terraform.tfstate"
    region = "eu-west-2"
  }

}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_ecr_repository" "sd_ecr_repo" {
  name                 = "sd_ecr_repo"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
