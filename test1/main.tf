
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


resource "aws_eip" "bar1" {
  vpc = true
}

resource "aws_eip" "bar2" {
  vpc = true
}


resource "aws_instance" "EC2-machine01" {
  ami ="ami-0f9cf087c1f27d9b1"
  instance_type = "t2.micro"
  key_name= "terraform"

  tags{
    Name= "MSR-test-Instance-1"
  }

}

resource "aws_eip_association" "eip_assoc1" {
  instance_id   = "${aws_instance.EC2-machine01.id}"
  allocation_id = "${aws_eip.bar1.id}"
}

resource "aws_instance" "EC2-machine02" {
  ami ="ami-0f9cf087c1f27d9b1"
  instance_type = "t2.micro"
  key_name= "terraform"

  tags{
    Name= "MSR-test-Instance-2"
  }

}


resource "aws_eip_association" "eip_assoc2" {
  instance_id   = "${aws_instance.EC2-machine02.id}"
  allocation_id = "${aws_eip.bar2.id}"
}
