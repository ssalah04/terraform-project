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

