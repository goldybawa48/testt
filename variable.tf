variable "ami-id" {
    type = map
    default = {
        us-east-1 = "ami-04a81a99f5ec58529"
        us-east-2 = "ami-0862be96e41dcbf74"
        us-west-1 = "ami-0ff591da048329e00"
        us-west-2 = "ami-0aff18ec83b712f05"
    }
}

variable "region" {
    type = string
}

variable "instance_tags" {
  type = map(string)
  default = {
    Environment = "learning"
    Project     = "terraform-learning"
  }
}

