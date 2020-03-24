# TODO: Designate a cloud provider, region, and credentials
provider "aws"{
	region = "us-east-1"
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "t2" {
  count = 4
  ami = "ami-0ff8a91507f77f867"
  instance_type = "t2.micro"
  subnet_id = "subnet-a3c869d5"
  tags = {
    Name = "udacity-t2-${count.index}"
  }
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4
resource "aws_instance" "m4" {
  count = 2
  ami = "ami-0ff8a91507f77f867"
  instance_type = "m4.large"
  subnet_id = "subnet-a3c869d5"
  tags = {
    Name = "udacity-m4-${count.index}"
  }
}
