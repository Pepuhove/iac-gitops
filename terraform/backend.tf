terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.10.0"
    }
  }
}


terraform {
  backend "s3" {
    bucket = "finance1214"
    key    = "state-file/finance1214.tfstate"
    region = var.aws_region
  }
}
