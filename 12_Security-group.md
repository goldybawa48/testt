# Security group in AWS

## Create a security group

- Code.

    ```bash
    provider "aws" {
      region = "us-east-1"
      access_key = "${var.access-key}"
      secret_key = "${var.secret-key}"
    }

    resource "aws_security_group" "first_security_group" {
      name        = "from_terraform"
      description = "learning terraform"

      ingress {
        description = "testing"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

      ingress {
        description = "testing"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

       egress {
         from_port        = 0
         to_port          = 0
         protocol         = "-1"
         cidr_blocks      = ["0.0.0.0/0"]
         ipv6_cidr_blocks = ["::/0"]
  }

    tags = {
      Name = "goldy"
      }
    }

    output "security-group-id" {
      value = aws_security_group.first_security_group.id
    }

- `ingress` = Inbound rule, `egress` = Outboundrule.
- I opened ports 22 and 80 in inbount and all trafic in outbount.
- `protocol` = all you know.
- `cidr_block` = is a ip range.
- `output` = you can print id, arn and many more thing. But i want to print id of this security group. valu = `<resource.name.you-want>`

- We can provide port range in from (x.number) to (y.number). 

    ```bash
      ingress {
        description = "testing"
        from_port   = 1
        to_port     = 200
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

- Now the ports from 1 to 200 is opend in security group.
- Now run `terraform init` to install aws plugin in the local system.
- Then `terraform plan` to see the what is going to created in aws.
- `terraform apply` to take a action.
- Verify the security group in aws.
- Search on google and find other atributes and resources of aws. https://registry.terraform.io/providers/hashicorp/aws/2.56.0/docs/resources/security_group .

## How to attach it to the instance

- Code .

    ```bash

    provider "aws" {
      region = "us-east-1"
      access_key = "${var.access-key}"
      secret_key = "${var.secret-key}"
    }

    resource "aws_security_group" "first_security_group" {
      name        = "from_terraform"
      description = "learning terraform"

      ingress {
        description = "testing"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

      ingress {
        description = "testing"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }

       egress {
         from_port        = 0
         to_port          = 0
         protocol         = "-1"
         cidr_blocks      = ["0.0.0.0/0"]
         ipv6_cidr_blocks = ["::/0"]
  }

    tags = {
      Name = "goldy"
      }
    }

    output "security-group-id" {
      value = aws_security_group.allow_tls.id
    }

    resource "aws_instance" "goldy1" {
      ami             = "ami-04a81a99f5ec58529"
      instance_type   = "t2.micro"
      key_name = "your-key-name"
      security_groups = [ "${aws_security_group.first_security_group.name}" ]

      tags = {
        Name = "terraform"
      }
    }

- Give your key name in `key_name`.
- You have to give the name of your security group like variable if you creating it with you instance.
- If your security group is already exists in aws, then

    ```bash

    resource "aws_instance" "goldy1" {
      ami             = "ami-04a81a99f5ec58529"
      instance_type   = "t2.micro"
      key_name = "your-key-name"
      security_groups = [ "default" ]

      tags = {
        Name = "terraform"
      }
    }

- simple give the name of your security group from aws.
