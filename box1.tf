provider "aws" {
  profile = "default"
  region  = "eu-west-1"
} 
terraform {
  backend "s3" {
    bucket = "toolbox-simplebucket"
    key = "toolnodbox.tfstate"
    region ="eu-west-1"
  }
} 
resource "aws_instance" "first_task" {
  ami                    = "ami-0aef57767f5404a3c"
  instance_type          = "t2.micro"
  key_name               = "devop22"
  vpc_security_group_ids = [aws_security_group.demo_sg1.id]

  tags = {
    Name        = "tool_box"
    provisioner = "terraform"
  }
}
resource "aws_instance" "second_node" {
  ami                    = "ami-0aef57767f5404a3c"
  instance_type          = "t2.micro"
  key_name               = "devop22"
  vpc_security_group_ids = ["sg-0a7d47e5d891e5124"]
  tags = {
    Name        = "tool_box1"
    provisioner = "terraform"
  }
}