# Dynamic blocks

**In simple terms, a dynamic block in Terraform lets you create multiple similar blocks of code based on a list or condition, making it easier to manage and repeat configurations.**

### Example 

- In the last chapter we create a security group and we open only two ports in inbound 80 or 22.

    ```bash
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

- If we have to open 10 port in the security group then the code becomes very large with the same lines.
- The solution of this problem is **`dynamic block`**

## Let's create our first dynamic block

- Now i have to open six ports in the security group.

- code .

    ```bash

    provider "aws" {
      region = "us-east-1"
      access_key = "${var.access-key}"
      secret_key = "${var.secret-key}"
    }

    resource "aws_security_group" "first_security_group" {
      name        = "from_terraform"
      description = "learning terraform"

      dynamic "ingress" {
        for_each = [22, 80, 443, 3306, 27027, 54312]
        iterator = port
        content {
          description = "alow"
          from_port   = port.value
          to_port     = port.value
          protocol    = "tcp"
          cidr_blocks = ["0.0.0.0/0"]
    }
  }

       egress {
         from_port        = 0
         to_port          = 0
         protocol         = "-1"
         cidr_blocks      = ["0.0.0.0/0"]
         ipv6_cidr_blocks = ["::/0"]
  }
  }

- The `dynamic ingress` block generates multiple ingress blocks dynamically.
- `for_each` This specifies the list [22, 80, 443, 3306, 27027, 54312], meaning it will create an ingress block for each port number in the list.
- `iterator` The `iterator = port` assigns the current item in the list to port within the content block.
- `content` Inside this block, the actual ingress block configuration is defined.