variable "region" {
  default = "ap-south-1"
}

variable "vpc-cidr" {
  default = "10.0.0.0/24"
}

variable "public-subnet-cidr" {
  type    = list(string)
  default = ["10.0.0.0/26", "10.0.0.64/26"]
}

variable "private-subnet-cidr" {
  type    = list(string)
  default = ["10.0.0.128/26", "10.0.0.192/26"]
}

variable "inbound" {
  type    = list(number)
  default = [22, 80, 443]
}