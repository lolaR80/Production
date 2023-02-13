provider "aws" {
    region = "us-east-1"
  access_key = "input access key"
  secret_key = "input secret key"

}
resource "aws_vpc" "Class-VPC" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "Class-VPC"
  }
}
resource "aws_subnet" "Class-subnet" {
  vpc_id            = aws_vpc.Class-VPC.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Class-Subnet"
  }
}
resource "aws_instance" "Class" {
  ami           = "ami-0aa7d40eeae50c9a9" # us-east-1a
  instance_type = "t2.micro"
  subnet_id = "subnet-012e76fe46ca0b755"
}
