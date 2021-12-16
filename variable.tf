variable "prefix" {
  type        = string
  description = "A name that is to be used as the resource name prefix. Usually it's the project name."
}

variable "environment" {
  type        = string
  description = "Name of the environment, e.g., dev, test, stable, staging, uat, prod etc."
}
variable "data_integration_trusted_role_arn" {
  type        = string
  description = "Arn of the trusted role the data intergration will use to invoke the lambda"
}



