# terraform taint

**The terraform taint command is used to manually mark a resource for recreation during the next terraform apply. This forces Terraform to destroy and then recreate the resource, which can be useful when you want to replace a resource without changing its configuration.**

### Example 

**I create a security group with terraform and i forget to add port 22. Now i want to add port 22 in my security group. We can add this, Go and add the port 22 with other port then run `terraform apply`. But the condition is that i want security group should be delete when i run `terraform apply` command then it will recrete with port number 22. In this condition we can use `terraform taint` command.**

## How to use

- I added the port 22 and, Now run the command `terraform plan`.
- the output is, `~ update in-place`. 
- `~` means resource going to edit when you run `terraform apply.`
- Condition is i want to recreat the security group with port 22.
- Now use `terraform taint`.
- syntax = `terraform taint <resource.resource-name>`.

- I run this command `terraform taint aws_security_group.first_security_group`.

- `terraform plan` now you will see `-/+` in the plan command. It's meaning is that first resource will delete then next will be created.

- Run `terraform apply` to apply the changes in aws.

## NOTE

- **terraform not recoment to use `terraform taint` coomand. we will descuss about this in next chapters. Why terraform not recomend.**