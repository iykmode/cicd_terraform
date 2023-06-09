terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.0.0"
    }
  }

  backend "s3" {
    region         = "us-east-1"
    profile        = "default"
    key            = "tfstatefile"
    bucket         = "statebucketproject011"
    dynamodb_table = "tech_test_table"
  }
}

provider "aws" {
  region = "eu-west-1"
}
