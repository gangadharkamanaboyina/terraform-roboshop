module "catalogue"{
    source = "../terraform-modules"
    instance_type = var.instance_type
    tags = var.tags
}