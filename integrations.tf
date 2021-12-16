resource "genesyscloud_integration_credential" "LambdaIntegrationCredentials" {
  name                 = "${local.resource_name_prefix}-LambdaIntegrationCredentials"
  credential_type_name = "amazonWebServicesARN"
  fields = {
    ARN = var.data_integration_trusted_role_arn
  }
}

resource "genesyscloud_integration" "LambdaDataIntegration" {
  intended_state   = "ENABLED"
  integration_type = "aws-lambda-data-actions"
  config {
    name        = "${local.resource_name_prefix}-Lambda-Integration"
    properties  = jsonencode({})
    advanced    = jsonencode({})
    credentials = { "AmazonWebServicesARN" : "${genesyscloud_integration_credential.LambdaIntegrationCredentials.id}" }
    notes       = "Integration created to invoke an AWS Lambda"
  }
}

