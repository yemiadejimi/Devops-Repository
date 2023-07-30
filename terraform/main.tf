data "aws_ami_ids" "ubuntu" {
  owners = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-20230516"]
  }
}


resource "aws_instance" "web" {
  ami           = data.aws_ami_ids.ubuntu.ids[0]
  instance_type = var.instance_type

  tags = {
    Name = "Terraform-practice-instance"
  }
}

variable "instance_type" {
  type = string
}

output "instance_id" {
  value = aws_instance.web.id
}

output "dns" {
  value = aws_instance.web.public_dns
}