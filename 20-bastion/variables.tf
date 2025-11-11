variable "project" {
    default = "ExpenseApp"
}

variable "env" {
    default = "prod"
}

variable "tags" {
    default = {
        Project = "ExpenseApp"
        Environment = "prod"
        Terraform = "True"
        DoNotDelete = "True"
    }
}

variable "name" {
    default = "bastion"
}