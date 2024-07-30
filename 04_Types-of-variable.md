# Types

## 1. List

- syntax of list is [ "value1" , "value2" , "value3"]
- In Terraform.

    ```bash
    variable "name" {
        type = list 
        default = ["goldy","bawa","dee"]
    }

    output "name" {
      value = var.name[0]
    }

- `value = var.name[0]` in this code [0] means print the first value of the list. It is called indexing.
- Now run the command `terraform plan`.
- Output is, `name = "goldy"`
- If i change the indexing [0] to [1] then it will print the second value of the list, `name = "bawa"`
- Give the list with command.

    ```bash
    terraform plan -var 'name=["goldy","bawa","dee"]'

## 2. Map
**In Terraform, map is used to create and manage key-value pairs, making it easier to organize and reference settings or resources by their names.**

- Syntax of map is,

  
`key1 = "value1"`


`key2 = "value2"`


`key3 = "value3"`

- In terraform,

    ```bash
    variable "name" {
    }

    variable "age" {
      type = map
      default = {
        goldy = "18"
        vishal = "22"
        sanjeev = "24"
      }
    }

    output "name-age" {
      value = "Hi my name is ${var.name} and my age is ${lookup(var.age, var.name)}"
    }

- What is lookup - the lookup function retrieves a value from a map using a specified key. I will discuss about this in the next chapter.
- In this code lookup find the value(age) from the map var.age of the name which is stored in var.name.
- Run the command `terraform plan` and enter the name i will enter goldy. Output is,

 ` name-age = "Hi my name is goldy and my age is 18"`

- Now try again with diffrent names.

