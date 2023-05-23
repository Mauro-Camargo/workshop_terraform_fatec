provider "aws" {
  region  = "us-east-1"
  profile = "workshop_fatec"
}

terraform {
  required_providers {
    aws = {
      version = ">=4.61.0"
    }
  }
}