module "catalogue"{
    source = "../terraform-modules"
    ami_id = data.aws_ami.id
    instance_type = var.instance_type
    sg_ids = aws_security_group.allow-all-ports.id
    tags = var.tags
}