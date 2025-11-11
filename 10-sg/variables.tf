variable "project" {
    default = "Roboshop"
}

variable "env" {
    default = "dev"
}

variable "tags" {
    default = {
        Project = "Roboshop"
        Environment = "dev"
        Terraform = "True"
        DoNotDelete = "True"
    }
}

# variable "vpc_id" {
#   type = string
# }