# Input variable
# variable for my region

variable "region" {
    description = "The aws region"
    type = string
    default = "us-east-1"
  
}

# AWS EC2 Instance Type
variable "instance_type" {
    description = "AWS EC2 instance type"
    type = string
    default = "t3.micro"
  
}

# AWS EC2 Instance key pair
variable "instance_keypair" {
    description = "AWS EC2 pair that need to be associated with EC2 instance"
    type = string
    default = "samkey"
  
}

# AWS EC2 Instance Type - List
variable "instance_type_list" {
    description = "EC2 instance type"
    type = list(string)
    default = ["t2.micro", "t2.medium", "t3.large"] # a list of strings to call them up we use index of   zero (o)= "t2.micro"
}                                                    # (1)= t2.medium (2)= t3.large 

# AWS EC2 Instance Type - map

variable "instance_type_map" {
    description = "EC2 instance type"
    type = map(string)
    default = {
        "dev" = "t3.micro"
        "qa" = "t3.small"
        "prode" = "t3.large"
    }
}

# our variable file for our dynamic security group
# here we are specifying the port we need open on our in&outbound rule (ingress & egress) using dynamic approach
# which it will help us to avoid opening range of ports that we dont actuall need them. So we just open only the one that we need.

variable "ingressrules" {
    type = list(number)
    default = [80,443,8080]  # here we are saying map this ports to my inbound rule
}

variable "egressrules" {
    type = list(number)
    default = [80,443,25,3306,53,8080]   # herev we are saying map this ports to my outbound rule
}

