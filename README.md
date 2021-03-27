# Terraform Grafana Dashboards Module

Terraform Grafana Dashboards is a module for creation of dashboards in grafana.

## Provision Instructions

Copy and paste into your Terraform configuration, insert the variables, and run **terraform init** :
```bash

module "dashboard-oms-apig-rest" {
  source       = "SunDevs/dashboard/grafana"
  REGION       = var.AWS_DEFAULT_REGION
  ACCOUNT      = var.AWS_EXTERNAL_ACCOUNT
  PROVIDER_URL = var.PROVIDER_URL
  PROVIDER_KEY = var.PROVIDER_KEY
  PROVIDER_ORG = var.PROVIDER_ORG
  FOLDER       = module.organization.folder
  DASHBOARD    = "./widgets/dashboard-template.tmpl"
  COMPONENT    = "ApiGatewayName"
  SUBCOMPONENT = [
    "LambdaName"
  ]
  STATE = [
    "StateMachineName"
  ]
  WIDGET_COMPONENT = [
    "./widgets/apigateway-template.tmpl"
  ]
  WIDGET_SUBCOMPONENT = [
    "./widgets/lambda-template.tmpl"
  ]
  WIDGET_STATE = [
    "./widgets/state-template.tmpl"
  ]
}

```