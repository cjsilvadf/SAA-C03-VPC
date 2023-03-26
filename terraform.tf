terraform {

  cloud {
    organization = "CleitonJose"

    workspaces {
      name = "SAA-C03"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.73.0"
    }
  }

  required_version = ">= 0.14.0"
}
