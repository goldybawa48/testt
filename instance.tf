resource "aws_instance" "goldy_instance" {
  count = 2
  ami           = lookup(var.ami-id, var.region)
  instance_type = "t2.micro"

  tags = merge(
    var.instance_tags,
    {
      Name = "goldy-instance-${count.index + 1}"
    }
  )
}

