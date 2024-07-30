# Output Block
The output block in Terraform is used to display information about your infrastructure once it's created or updated. It can show details like resource IDs, IP addresses, or any other value you want to make easily accessible after the deployment or before the deployment.

**But Now we just use it to print hello world or other values**

## Make a file First terraform file

- make a file with extension **.tf**.

- Add a output block in this file.

    ```bash
    output "Output_namea" {
      value       = "Hello World"
    }

- Now run this command in the directory in which **.tf** fileis placed.

    ```bash
    terraform plan

- Your output on the terminal is looking like this :-

  `Output_name = "Hello World"`

- Now Go forward, Print multiple output blocks.

    ```bash
  output "Output_name" {
    value       = "Hello World"
  }

  output "Output_name1" {
    value       = "Hello Goldy"
  }

  output "Output_name2" {
    value       = "Hello Bawa"
  }

- Run the command

  `terraform plan`

- Output on the terminal.

  `Output_name  = "Hello World"`
  
  `Output_name1 = "Hello Goldy"`
  
  `Output_name2 = "Hello Bawa"`

## Notes 

1. The name after the output block is always different in the same file. If the names of the blocks are the same, then Terraform will give you an error.
2. In Terraform, the plan command is used to preview the changes that will be made to your infrastructure. This helps you review and verify the changes before executing them. 
