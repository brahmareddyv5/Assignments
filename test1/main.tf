
variable "accesskey" {
  type="string"
}

variable "secretkey" {
  type="string"
}

provider "aws" {
  access_key = "${var.accesskey}"
  secret_key = "${var.secretkey}"
  region     = "us-east-1"
}

resource "aws_instance" "EC2-machine01" {
  ami ="ami-0f9cf087c1f27d9b1"
  instance_type = "t2.micro"
  key_name= "terraform"

  tags{
    Name= "MSR-test-Instance-1"
  }

}

resource "aws_instance" "EC2-machine02" {
  ami ="ami-0f9cf087c1f27d9b1"
  instance_type = "t2.micro"
  key_name= "terraform"

  tags{
    Name= "MSR-test-Instance-2"
  }

}