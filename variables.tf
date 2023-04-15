data "aws_lb_target_group" "app-lb-tg" {
  arn = var.lb_tg_arn
}

variable "profile" {
  type    = string
  default = "default"

}

variable "key_name" {
  type    = string
  default = "jenkins"

}

variable "instance-type" {
  type    = string
  default = "t3.small"

}

variable "subnet_id" {
  type    = string
  default = "subnet-05d0628161650959d"
}

variable "lb_tg_arn" {
  type    = string
  default = "arn:aws:elasticloadbalancing:eu-west-1:323871868294:targetgroup/app-lb-tg/7be2444ec26d2b9e"

}

variable "security_grp" {
  type    = string
  default = "sg-040366f4af6aed5b2"
}

variable "ami_id" {
  type    = string
  default = "ami-03f295fecc39988fc"
}

variable "webserver-port" {
  type    = number
  default = 80

}

variable "nginx_version" {
  type    = string
  default = "1.20.1"

}