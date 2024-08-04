# AWS ec2 instance

**Now we are going to create AWS resources**

## Instance

- Make two files `main.tf` and `provider.tf`.
- To make any resource in aws we have to give access key and secret key of aws.
- Go to https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance this website to read, use resources and atributes.
- `providr.tf`

    ```bash
    provider "aws" {
      region = "us-east-1"
      access_key = ""
      secret_key = ""
    }

- Enter your access key and secret key.
- `main.tf`

    ```bash
    resource "aws_instance" "First-instance-terraform" {
      ami           = "ami-04a81a99f5ec58529"
      instance_type = "t2.micro"

      tags = {
        Name = "HelloWorld"
      }
    }

- `ami` In aws when we select the opreting system image, copy the ami id from this.
- Enter the instance type and give tags to instance.
- Now run `terraform apply` to install plugin.
- Then run `terraform plan` and know information about instance.
- Run `terraform apply` to take action.
- Check the instance in aws. Try to ssh.
- It's not possible to connect this instance. Because we didn't provide any ssh-key and security group to our instance.
- Now in the next chapter we are goin to know How to add all necessary atributes to ec2 instance.