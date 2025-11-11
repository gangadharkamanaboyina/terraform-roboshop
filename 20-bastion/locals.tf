locals {
    common_name = "${var.project}-${var.env}"
    ami_id = data.aws_ami.DevopsPrac.id
    instance_type = "t3.micro"
    sg_id = data.aws_ssm_parameter.bastion_sg_id.value
    public_subnet_ids = split(",", data.aws_ssm_parameter.public_subnet_ids.value)
}