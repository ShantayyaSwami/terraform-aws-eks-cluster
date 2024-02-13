terraform {
  backend "s3" {
    bucket         = "statefilebucket123tks"
    dynamodb_table = "statelock"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}