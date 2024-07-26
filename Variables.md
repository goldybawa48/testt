# Variables
We use variables in Terraform to simplify code, make configurations reusable, and allow easy adjustments without changing the main setup files.

- synatx of variable is below.

    ```bash
    variable name {
      type        = string
      default     = ""
      description = "description"
    }

- After the variable, we have to give the name of the variable. The names of two or more variables should not be the same; if the names are same, then Terraform will give an error.
- **Type** It is not Nessesary, but specifying the type can help with validation and provide clarity in your configurations. There are many types in varibale Like string, list, map, number, bool, set, object and many more.
- **default** it a default value of variable if we are not giving any value to variable then it pick up the default value.
- **desription** it is not Nessesary, The description is used to document the purpose of the variable, which can be helpful for others (or yourself) when maintaining the code.

## Print your first varible

- Make file with .tf extension.
    ```bash
    variable name {}

- Now add output block to print the variable.

    ```bash
    output name {
      value       = var.name
    }

- Your file if Look Like this.
    ```bash
    variable name {}

    output name {
      value       = var.name
    }

- Now run the `terraform plan` command on the terminal.
- Now terraform will ask you to give the value for variable. Give any value. I give my name Goldy.
- The output is looking like this.
  `name = "Goldy"`

- Now go forward add default value in varibale.
    ```bash
    variable name {
        type = string 
        default = "Goldy"
    }

    output name {
      value       = var.name
    }

- Run the `terraform plan`. Now terraform don't ask you the value of variable it will print the default value.
- If you run this command `terraform plan -var "name=bawa"`, Then terraform will not print the default value Goldy, It will print bawa.
- If you don't give the value according to the type of variable then terraform give you an error.
- Print the Variable with any string.
    ```bash
    variable name {
        type = string
    }

    output name {
      value       = "Hello ${var.name}"
    }

- Run `terraform plan` command, Now Your value is printed with the Hello. I give my name in the value.
- Output is, `name = "Hello goldy"`


