resource "aws_instance" "fusion" {
  ami = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.fusion-sg.id]
  tags = var.ec2-tags
}


resource "aws_security_group" "fusion-sg" {
  name        = var.ingress_name
#   description = var.ingress_description
   dynamic ingress {
    for_each = var.fusion_ingress_rules
    content {
    description = ingress.value["description"]
    from_port        = ingress.value["from_port"]
    to_port          = ingress.value["to_port"]
    protocol         = ingress.value["protocol"]
    cidr_blocks      = ingress.value["cidr_blocks"]
    }
  }
 egress {
    from_port        = var.egress_from_port
    to_port          = var.egress_to_port
    protocol         = var.egress_protocol
    cidr_blocks      = var.egress_cidr_block
  }
  tags = var.sg-tags
}