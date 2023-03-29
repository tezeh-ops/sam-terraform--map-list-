/*
# Create Security Group - SSH Traffic
resource "aws_security_group" "vpc-ssh" {
  name        = "vpc-ssh"
  description = "Dev VPC SSH"
  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    description = "Allow all IP and Ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create Security Group - Web Traffic
resource "aws_security_group" "vpc-web" {
  name        = "vpc-web"
  description = "Dev VPC Web"

  ingress {
    description = "Allow Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow Port 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all IP and Ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}   */


resource "aws_security_group" "web-traffic" {
    name = "Allow HTTPS"


    dynamic "ingress" {
        iterator = port    # is a loop that will go through the list of port
        for_each = var.ingressrules    # setting our loop condition
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks =  ["0.0.0.0/0"]

        }
    }

    dynamic "egress" {
        iterator = port    # is a loop that will go through the list of port that we have in our variable to mount them
        for_each = var.egressrules    # setting our loop condition, Say for each port you see use this format to creater it.
        content {
            from_port = port.value
            to_port = port.value
             protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"]

        }
    }
}    