# First resource in Terraform

- Firstly we have to know about providers in terraform. In Terraform, providers are tools that connect Terraform to various cloud platforms (like AWS or Google Cloud) and services, allowing you to manage and use resources from those platforms.
- To see the providers of diffrent platforms visit https://registry.terraform.io/browse/providers .
- We use `terraform init` command to install provider in our local system which we are using.

## Creating github repository from terraform code

- Code.

    ```bash
    resource "github_repository" "goldy" {
      name        = "testing-repo"
      description = "hello from terraform"
      visibility = "public"
      auto_init = true
    }

- after the `resource` we have to give resource name which we want to make.
- search on the google what you want to make simple `terraform resource github repo`. Open the first site of terraform and know all resources and atributes.
- `name` is the repository name.
- `description` is description of the repository.
- `visibility` public or private.
- `auto_init` if true then it make readme.md if false then readme.md is unvailible.

**Create two files first is main.tf second is provider.tf**

- In `provider.tf` add your provider.

    ```bash
    provider "github" {
        token = ""
    }

- In the double quotes enter your github token.
- In `main.tf` add you code.

    ```bash
    resource "github_repository" "goldy" {
      name        = "testing-repo"
      description = "hello from terraform"
      visibility = "public"
      auto_init = true
   }
  
- Now run `terraform providers` command then you will know about provider.
- Now run `terrafrom init` command to install the provider of github.
- Now run `terraform plan` command to know about repository.
- Now run `terraform apply` command to get in action which you writen in the code.
- Now verify in github your repo with your given name is present there.
- To delete the repository run `terraform destroy` command.

**------**

- You can run `terraform apply --autoapprove` then you don't have to give yes or no.