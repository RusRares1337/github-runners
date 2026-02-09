terraform {
    required_version = ">=1.0"

    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
# Local state
backend "local" {
    path = "terraform.tfstate"
    }
}

provider "aws" {
    region = var.aws_region
    default_tags {
        tags = {
            Project     = "github-runners"
            ManagedBy   = "terraform"
            Environment = "var.environment"

        }
    }
}

