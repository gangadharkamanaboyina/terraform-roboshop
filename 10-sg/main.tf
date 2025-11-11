module "sg" {
  source  = "github.com/gangadharkamanaboyina/terraform-module-sg.git?ref=main"

  name    = "${var.project}-${var.env}-app"
  project = var.project
  env     = var.env
  tags    = var.tags
  vpc_id  = data.aws_ssm_parameter.vpc_id.value

  ingress_ports = [22, 80, 8080]
  egress_ports  = [443]
}
