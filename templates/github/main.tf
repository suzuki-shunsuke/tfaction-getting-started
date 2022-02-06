locals {
  # CHANGE
  github_owner = "suzuki-shunsuke"
}

terraform {
  required_version = ">= 1.0"
  backend "s3" {
    region = "us-east-1"        # CHANGE
    bucket = "<S3 Bucket Name>" # CHANGE
    key    = "%%TARGET%%/v1/terraform.tfstate"
  }
}

terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "github" {
  owner = local.github_owner
}
