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
  default = "subnet-070953972b87f351a"
}

variable "security_grp" {
  type    = string
  default = "sg-0f557aa1cebfd5061"
}

variable "ami_id" {
  type    = string
  default = "ami-03f295fecc39988fc"
}
