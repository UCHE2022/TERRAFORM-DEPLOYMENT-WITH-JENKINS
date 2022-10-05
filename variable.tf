variable "vpccidr" {
  type = string
  description = "This is the main vpc cidr block"
  default = "10.0.0.0/16"
}

variable "publicsubnetcidr" {
  type = string
  description = "This is the public subnet cidr block"
  default = "10.0.1.0/24"
}

variable "privatesubnetcidr" {
  type = string
  description = "This is the private subnet cidr block"
  default = "10.0.2.0/24"
}

variable "az" {
  type = string
  description = "This is AZ for subnets"
  default = "us-east-1a"
  
}
variable "pubmainkey" {
  type = string
  description = "public key pair"
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC+zfcs5BpV5ExkU67nciBKb2sOe++iJQYtLhnyUgY24NiBI+X0gd5wG2XkK4E/wnQXveKXEAn71lzL261fDKZcXv2VkeJqQUG5zWLOmcPkqX02iACkUpxbJu44DPCGm5IySXLLgXlxbgI+5UmoTYWq/IpO31leNyXVcQQaEAv/9RdL3WTovwBO/u/01THz0b72mU5R4Oq6rzotY+oHu6zVv5jj/N5YHZj2WRyysMEngyHj/1TicL2xiWJylTEYKgrKIu4iAQPHLdRMUw0aqyDayYDoE7Um9IFMgtdfsuHm86RBywoww4GdoN6jj5S5kMddQR31PQyPdVTl+U7JmNHPJnWA4slB9zIFkLhIzM5IFjhXLWltB2gdvJ/kOwa99cYMqnDOgufXB6ExOxyLUWowYysFDQCjSNTRwxSuAmIdRFENLQtbsNhMXimE/faj1w0OCH2SlE9sgQ3s6dKzEYKNblJlo2RHmiD8XEPwce8f+WwYy7Au79+61w4ONIamdF0= ucheonyemah@uches-MacBook-Air.local"

}
variable "keyname" {
  type = string
  description = "The name of the key pair"
  default = "main"
}

variable "ami" {
    type = string
    description = "Ec2 Instance ami"
    default = "ami-046a5648dee483245 "
}

variable "instance_type" {
    type = string
    description = "Ec2 instance type"
    default = "t2.micro"
}