#creating the Vpc
resource "aws_Vpc" "main-Vpc" {
   cidr_block =var.vpccidr
   instance_tenancy ="default"
   enable_dns_hostnames = true

   tags = {
     "Name" = "main-Vpc"
   }
}

#creating the IGW
resource "aws_internet_gateway" "mainigw" {
  Vpc_id = aws_Vpc.main-vpc.Vpc_id 

  tags = {
    "Name" = "mainigw"
  }
}

#creating the public subnet 
resource "aws_subnet" "publicsubnet" {
    vpc_id = aws_Vpc.main-vpc.id
    cidr_block = var.publicsubnetcidr
  availability_zone =var.az
  map_public_ip_on_launch =true

  tags = {
    "Name" = "publicsubnet"
  }
}

#creating the private subnet
resource "aws_subnet" "privatesubnet" {
  vpc_id = aws_vpc.main-vpc.id
  cidr_block = var.privatesubnetcidr
  availability_zone = var.az
  map_public_ip_on_launch = false

  tags = {
    "Name" = "privatesubnet"
    }
}

#creating routetable
resource "aws_route_table" "publicRT" {
  vpc_id = aws_vpc.main-vpc.id

route {
  cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.mainigw.id
 }
   
  tags = {
    "Name" = "publicRT"
   }  
 }
#Creating the route table assosciation
resource "aws_route_table_association" "publicRTA" {
  subnet_id = aws_subnet.publicsubnet.id
  route_table_id = aws_route_table.publicRT.id
}


#creating security group for public instance 
resource "aws_security_group" "publicinstanceSG" {
   name = "public-instance-SG"
   description = "SG for the instance in the public subnet"
   vpc_id = aws_vpc.main-vpc.id
  
   ingress {
     cidr_blocks = [ "0.0.0.0./0" ]
     description = "SSH Access"
     from_port = 22
     to_port = 22
     protocol ="tcp"
}

ingress {
     cidr_blocks = [ "0.0.0.0./0" ]
     description = "HTTP Access"
     from_port = 80
     to_port = 80
     protocol ="tcp"
}

engress {
    from_port = 0
    to_port = 0
    protocol ="-1"
    cidr_blocks = ["0.0.0.0./0"]
 }

 tags = {
   "Name" = "publicinstanceSG"
}
}

#generating public/private key pair
resource "aws_key_pair" "mainkey" {
  key_name = var.keyname
  public_key = var.Pubmainkey
}

#creating EC2 instance
resource "aws_instance" "webapp" {
  ami = var.ami
  instance_type = var.instance_type
  key_name =var.keyname
  security_groups = ["${aws_security_group.publicinstanceSG.id}"]
  subnet_id = aws_subnet.publicsubnet.id
  associate_public_ip_address = true

  tags = {
    "Name" = "webapp" 
  }
}