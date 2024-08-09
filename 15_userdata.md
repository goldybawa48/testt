# User data

**User data in AWS lets you automatically set up and configure your server when it starts. You can use it to run scripts that install software and make sure everything is ready to use without doing it by hand.**

## How to use in terraform

- to use userdata in terraform we use `user_data` atribute in terraform.
- make a file which contains your userdata.
- I make `userdata.sh` file and i want my script install the nginx in instance.
- userdata.sh file .

    ```bash
    #!/bin/bash
    sudo apt update -y
    sudo apt install apache2 -y

- main.tf file .

    ```bash
    resource "aws_instance" "goldy" {
      ami           = "ami-04a81a99f5ec58529"
      instance_type = "t2.micro"
      key_name = "key-name"
      security_groups = "security-group"
      user_data = file("${path.module}/userdata.sh")

      tags = {
        Name = "HelloWorld"
      }
    }

- Now run `terraform apply`. then `userdata.sh` will run in the server.
- Now this is how we can use userdata in terraform.
