provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "local" {
    path = "state/terraform.tfstate"
  }
}
