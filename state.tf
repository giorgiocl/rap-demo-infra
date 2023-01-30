terraform {
  backend "s3" {
    bucket = "rap-demo-infra-state"
    key    = "infra"
    region = "us-east-2"
  }
}