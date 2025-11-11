/* module "sg" {
  source  = "github.com/gangadharkamanaboyina/terraform-module-sg.git?ref=main"

  name    = "${var.project}-${var.env}-app"
  project = var.project
  env     = var.env
  tags    = var.tags
  vpc_id  = data.aws_ssm_parameter.vpc_id.value

  ingress_ports = [22, 80, 8080]
  egress_ports  = [443]
}
 */

resource "aws_security_group" "main" {
  vpc_id = local.vpc_id
  count = length(var.names)
  name = var.names[count.index]
  
    egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project}-${var.env}-${var.names[count.index]}"
    }
  )
}