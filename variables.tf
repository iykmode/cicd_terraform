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
  default = "t3.medium"

}

variable "subnet_id" {
  type    = string
  default = "subnet-07f7f49a9967db4a2"
}

variable "security_grp" {
  type    = string
  default = "sg-0aa03a28b6021155d"
}

variable "ami_id" {
  type    = string
  default = "ami-03f295fecc39988fc"
}
