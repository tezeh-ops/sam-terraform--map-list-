#EC2 instance
resource "aws_instance" "myec2" {
    ami = data.aws_ami.amazonlinux.id
    #instance_type = var.instance_type
    #instance_type = var.instance_type_list[1]    # for list and 1 is map to "t2.medium" in our variable file
    instance_type = var.instance_type_map["dev"]  # For map
    user_data = file("${path.module}/app1-install.sh")
    key_name = var.instance_keypair
    vpc_security_group_ids = [aws_security_group.web-traffic.name]       #[ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id ]
    count = 3       # a meta-argument which aiter the behavior of our resource (count = 3) is to stay im going to creat this resource 3 times
    tags = {             # it will creat 3 ec2 instances. So how cat we name the 3 instance?
        Name = "prod-${count.index}"  # this -${count.index} willname the instances like e.g> prod-0, prod-1, prod-2 
       
    }
  
}

/*
# drawback of using count in this example
- Resource Instance in this case were identified using index numbers
instead of string values like actual subnet_id 
- if an element was remove from the middle of the list, 
every instance after the element would see its subnet_id value
change, resulting in more remote object changes than intended.
- Even the subnet_ids should be pre-define or we need to get them again
using for_each or for for using various datasource
- using for_each give the same flexibility without the extra churn
*/
