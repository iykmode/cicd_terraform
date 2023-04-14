variable "profile" {
  type    = string
  default = "default"

}

variable "region-main" {
  type    = string
  default = "us-east-1"

}

variable "external_ip" {
  type    = string
  default = "0.0.0.0/0"

}

variable "instance-type" {
  type    = string
  default = "t3.large"

}

variable "webserver-port" {
  type    = number
  default = 80

}
