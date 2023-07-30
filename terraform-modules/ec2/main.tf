data "aws_ami_ids" "ubuntu" {
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230516"]
  }
}


resource "aws_instance" "web" {
  ami           = var.ami_id == "" ? data.aws_ami_ids.ubuntu.ids[0] : var.ami_id
  instance_type = var.instance_type

  tags = {
    Name = var.tag_name
  }
    provisioner "local-exec" {
    command = "echo The server IP address is ${self.private_ip}"
  }
}

variable "instance_type" {
  type = string
}

variable "ami_id" {
  type = string
  default = ""
}

variable "tag_name" {
  type = string
}

output "instance_id" {
  value = aws_instance.web.id
}

output "dns" {
  value = aws_instance.web.public_dns
}