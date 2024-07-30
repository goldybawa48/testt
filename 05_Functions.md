# Functions
**In Terraform, functions are tools that help you manipulate and process data in your configuration files, like formatting text or doing calculations. They make it easier to customize and control your infrastructure setup.**

## Types

### 1. join

- join function is used in lists to print all the values of list.
- Syntax of join. `value = join(",",var.list)`.
- After the join `","` in double cources we have to provide seprater. After the seprater we have to give our list name. 
- One example of join in terraform.

    ```bash
    variable "list" {
      type = list 
      default = ["goldy","vishal","sanjeev"]
    }

    output "name" {
      value = join(",",var.list)
    }

- Output of this code is `name = "goldy,vishal,sanjeev"`

- Now i will change seprater in the code.


    ```bash
    variable "list" {
      type = list 
      default = ["goldy","vishal","sanjeev"]
    }

    output "name" {
      value = join("--->",var.list)
    }

- Now the output of this code is `name = "goldy--->vishal--->sanjeev"`

## 2. upper

- This funtion is used to make the value uppercase.
- In terraform.

    ```bash
    variable "list" {
      type = list 
      default = ["goldy","vishal","sanjeev"]
    }

    output "name" {
      value = upper(var.list[0])
    }

- The output is `name = "GOLDY"`

## 3. lower

- This function is used to make the volue lowercase.
- In terraform.

    ```bash
    variable "list" {
      type = list 
      default = ["GOLDY","VISHAL","SANJEEV"]
    }

    output "name" {
      value = lower(var.list[0])
    }
s
- The output is `name = "goldy"`

## 4. title

- This function is used to make the first latter capital of the value.
- In terraform.

    ```bash
    variable "list" {
      type = list 
      default = ["goldy","vishal","sanjeev"]
    }

    output "name" {
      value = title(var.list[0])
    }

- The output is `name = "Goldy"`

## 4. lookup

- lookup is used in terraform to match the given abject in map and get the matching value of that object.

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

      value = "Hi me name is ${var.name} and my age is ${lookup(var.age, var.name)}"
    }

- In this code lookup find the value(age) from the map(var.age) of the name which is stored in var.name.

## Note

- You can try these functions with all types of variables.
- Try to study more funtions from https://developer.hashicorp.com/terraform/language/functions

