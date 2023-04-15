variable "profile" {
  type    = string
  default = "default"

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
