
terraform {
  backend "s3" {
    bucket = "finance1214"
    key    = "state-file/finance1214.tfstate"
    region = var.aws_region
  }
}
