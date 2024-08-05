# SSH key

**Now we are going to add ssh key to our instance**

## Create a ssh key in aws

- Run the `ssh-keygen` in local terminal to create ssh keys. Now move *.pub key to the the same location where your terraform code is placed.
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance use this website to use atributes.
- Now learn about `file("${path.module}/filename")`. This is used to print the content of the file which is present in present working directory.
- Code.
  
    ```bash
     resource "aws_key_pair" "sample" {
      key_name = "testing"
      public_key = file("${path.module}/id_ed25519.pub")
    }

- If we run `terraform apply` then one key-pair is will created in the aws.

## Attaching the key to instance

- If you want to attach a existing key to the instance.

    ```bash
    resource "aws_instance" "web" {
      ami           = "ami-04a81a99f5ec58529"
      instance_type = "t2.micro"
      key_name = "${key-name}"

      tags = {
        Name = "HelloWorld"
      }
    }

- Simply give the key name of the existing key pair in the aws.

- If you want to attach a new key pair with instance.

    ```bash
    resource "aws_key_pair" "sample" {
      key_name = "testing"
      public_key = file("${path.module}/id_ed25519.pub")
    }

    resource "aws_instance" "web" {
      ami           = "ami-04a81a99f5ec58529"
      instance_type = "t2.micro"
      key_name = "${aws_key_pair.sample.key_name}"

      tags = {
        Name = "HelloWorld"
      }
    }

- `key_name`, = you have to provide name path of your key.

