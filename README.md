
This Terraform module creates a Genesys Cloud Integration for a Lambda. This integration, along with the corresponding lambda data action will allow you invoke an AWS Lambda from your AWS account from a Genesys Cloud data action. The documentation for the building a Genesys Cloud Integration and Data Action manually can be found here:

1. [Genesys Cloud Data Actions Integration](https://help.mypurecloud.com/articles/about-the-aws-lambda-data-actions-integration/)
2. [Example Genesys Cloud Data Action](https://help.mypurecloud.com/articles/example-aws-lambda-function-with-a-data-action/)

## Usage

Shown below is an example of how to configure the remote module.

```hcl
module "lambda_integration" {
   source             = "git::https://github.com/GenesysCloudDevOps/integration-lambda-module.git?ref=main"
   environment                       = "dev"
   prefix                            = "dude-order-status"
   data_integration_trusted_role_arn = ""<<YOUR AWS ARN TRUSTED ROLE HERE>>
}
```

The above snippet will create a Genesys Cloud integration called dev-dude-order-status-Lambda-Integration. Underneath the cover's this remote module will also create a Genesys Cloud credential containing the trusted IAM role that will be assumed by Genesys Cloud when it invokes your Lambda. To review setting up a trusted role please review the [Genesys Cloud Data Action Integrations Lambda](https://help.mypurecloud.com/articles/about-the-aws-lambda-data-actions-integration/) documentation. 


## Requirements

| Name | Version |
|------|---------|
| <a name="provider_terraform"></a>[terraform](https://www.terraform.io/) | >= 1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_genesyscloud"></a> [genesyscloud](https://registry.terraform.io/providers/MyPureCloud/genesyscloud/latest) | >= 1.0|


## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="environment"></a> [environment](#environment)  |  A string value used in the naming conventions to indicate what environment this lambda integration for.| `string` | yes |
| <a name="prefix"></a> [prefix](#prefix) |  Name put in front of the integration created. The created name will you the environment and the prefix to create an integration call `<<environment>>-<<prefix>>-Lambda-Integration` | `string` | yes |
| <a name="data_integration_trusted_role_arn"></a> [data_integration_trusted_role_arn](#data\_\integration\_\trusted\_\role\_\arn) | The AWS arn for the trusted IAM role that will be assumed by Genesys Cloud when it invokes your Lambda. | `string` | yes |

# Outputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="genesys_integration_id"></a> [genesys_integration_id](#genesys\_\integration\_\id)  |  The integration id for the created Genesys Cloud Integration. This id will be needed when you associate data actions with the integration.| `string` | yes |
