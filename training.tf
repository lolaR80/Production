provider "aws" {
  region     = "us-east-1"
  access_key = "accesskey"
  secret_key = "secretkey"
}
resource "aws_vpc" "text-VPC" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "text-VPC"
  }
}
resource "aws_subnet" "text-subnet" {
  vpc_id            = aws_vpc.text-VPC.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "text-Subnet"
  }
}

resource "aws_subnet" "text-subnet-private" {
  vpc_id            = aws_vpc.text-VPC.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "text-Subnet-private"
  }
}

resource "aws_internet_gateway" "text-igw" {
  vpc_id = aws_vpc.text-VPC.id

  tags = {
    Name = "text-igw"
  }
}

resource "aws_instance" "text" {
  ami           = "ami-0aa7d40eeae50c9a9" # us-east-1a
  instance_type = "t2.micro"
  subnet_id = "subnet-0bcf0a66b74e07d5e"
  tags = {
    "Name" = "text"
  }
}

resource "aws_s3_bucket" "text-s3-buc" {
  bucket = "my-oa-text-bucket"

  tags = {
    Name        = "text-s3-buc"
    Environment = "Dev"
  }
}
