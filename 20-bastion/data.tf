data "aws_ssm_parameter" "bastion_sg_id" {
  name = "/${var.project}/${var.env}/bastion_sg_id"
}

data "aws_ami" "DevopsPrac" {

        most_recent = true
        owners = ["973714476881"]
        tags = {
            Name   = "RHEL-9-DevOps-Practice"
            Tested = "true"
        }

        filter {
           name = "virtualization-type" 
           values = ["hvm"]
        }
        
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "/${var.project}/${var.env}/public_subnet_ids"
}