locals {
  # CHANGE
  region            = "us-east-1"
  s3_backend_bucket = "<S3 Bucket Name>"
  github_owner      = "suzuki-shunsuke"
}

terraform {
  required_version = ">= 1.0"
  backend "s3" {
    bucket = local.s3_backend_bucket
    key    = "%%TARGET%%/v1/terraform.tfstate"
    region = local.region
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
