variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "ec2-tags" {
  type = map
  default = {
    Name = "Backend"
    Project = "Fusion"
    Terraform = true 
    Environment = "Dev"
  }
}
variable "fusion_ingress_rules" {
  default = [
    {
    description = "Allow ssh ports"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    },
    {
    description = "Allow HTTP ports"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    },
    {
    description = "Allow 8080 ports"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }
  ]
}

variable ingress_name{
    type = string
    default = "backen-sg-ingress"
}

variable "egress_from_port" {
  type = number
  default = 0
}

variable "egress_to_port" {
    type = number
    default = 0
}

variable "egress_protocol" {
  type = string
  default = "-1"
}

variable "egress_cidr_block" {
  type = list
  default = ["0.0.0.0/0"]
}

variable "sg-tags" {
  type = map
  default = {
    Name = "Fusion-Backend-sg"
    Project = "Fusion"
    Terraform = true 
    Environment = "Dev"
  }
}