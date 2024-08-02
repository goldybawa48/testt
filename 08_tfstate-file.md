# terraform.tfstate file

**A tfstate file in Terraform keeps a record of your infrastructure's current setup, helping Terraform know what resources exist and how to update them correctly.**

## .tfstate

- In last chapter we create a git repository. When we run `terraform apply` a tfstate file is created. It is created because terraform have to know about all the resources you created.
- terraforn know the resource with resource name. When we run `terraform destroy` terraform check all the resources from this file and then it will delete all of them.
- Is you want to delete a specific resource then simple run `terraform destroy --target <resource.resource-name>`.

## Commands

1. `terraform validate` The terraform validate command checks your Terraform configuration files for syntax errors and logical issues, ensuring they are correct and valid before applying any changes.
2. `terraform show` The terraform show command lets you see the details of your current infrastructure setup from tfstat file or planned changes in an easy-to-read format.
3. `terraform refresh` The terraform refresh command updates the state file to reflect the actual state of resources. Example i create a repository with desciption `hello from goldy` and any devloper change after me change the description of this repo to `hello from xyz`.
- In this situation in my tfstat file description have value `hello from goldy`, if i run `terraform refresh` command terraform will refresh all infrastructure to current state.
- Now in tfstat file description value is `hello from xyz`.
4. `terraform console` with this command we can print the values of variables. Syntax is <var.variablename>.
5. `terraform fmt` this command is used to set the indentation of terraform files.