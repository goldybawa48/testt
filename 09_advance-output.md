# Output

**In our last chapters we use output to print only the variables. But now we use output to print resources information.**

- in this code.

    ```bash
    resource "github_repository" "goldy" {
      name        = "testing1-repo"
      description = "hello from terraform"
      visibility = "public"
      auto_init = true
    }

- I want, when i run `terraform plan` or `terraform apply` terraform give my the https url of my repository.

    ```bash
    output "url" {
      value = github_repository.goldy.html_url
    }

- The syntax of this is `<resource.resource-name.what'you'want>`.
- I run `terraform plan` the output is, `url = (known after apply)`
- Now i run `terraform apply` the output is, `url = "https://github.com/goldybawa48/testing1-repo"`
- Now i want ssh and https both urls.

    ```bash
    output "https_url" {
      value = github_repository.goldy.html_url
    }

    output "ssh_url" {
      value = github_repository.goldy.ssh_clone_url
    }

- `terraform plan` output is, `https_url = (known after apply) ssh_url   = (known after apply)`
- `terraform apply` output is, `https_url = "https://github.com/goldybawa48/testing1-repo"
ssh_url = "git@github.com:goldybawa48/testing1-repo.git"`

- So that's how output works in real world.
- You can search `argument refrences` of your resource on the google to know what to write at the end of the value of output.