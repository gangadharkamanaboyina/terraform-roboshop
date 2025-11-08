variable "instance_type" {
    default = "t3.micro"
}
variable "tags" {
    type = map
    default = {

        Terraform = true
        Name = "Catalogue"
    }
}


