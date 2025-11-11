resource "aws_ssm_parameter" "sg_ids" {
  count = length(var.names)
  name  = "/${var.project}/${var.env}/${var.names[count.index]}_sg_id"
  type  = "String"
  value = aws_security_group.main[count.index].id
}