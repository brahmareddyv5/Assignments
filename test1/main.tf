
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

resource "aws_vpc" "main" {
  cidr_block = "10.10.0.0/16"
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TCP inbound traffic"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}


resource "aws_instance" "EC2-machine01" {
  ami ="ami-0f9cf087c1f27d9b1"
  instance_type = "t2.micro"
  key_name= "terraform"
  #vpc_security_group_ids= "${aws_security_group.allow_tls.id}"
  associate_public_ip_address= "${aws_eip.bar.id}"
  security_groups= "${aws_security_group.allow_tls.id}"

  tags{
    Name= "MSR-test-Instance-1"
  }

}

resource "aws_instance" "EC2-machine02" {
  ami ="ami-0f9cf087c1f27d9b1"
  instance_type = "t2.micro"
  key_name= "terraform"
  vpc_security_group_ids= "${aws_security_group.allow_tls.id}"
  associate_public_ip_address= "${aws_eip.bar.id}"

  tags{
    Name= "MSR-test-Instance-2"
  }

}

resource "aws_eip" "bar" {
  vpc = true
}