# Terraform Grafana Dashboards Module

Terraform Grafana Dashboards is a module for creation of dashboards and panels in grafana.

## Provision Instructions

Copy and paste into your Terraform configuration the folder **example** , insert the variables, and run **terraform init**:


```bash

module "dashboard-grafana" {
  source       = "SunDevs/dashboard/grafana"
  version      = "x.x.x"
  REGION       = "AWS_DEFAULT_REGION"
  ACCOUNT      = "AWS_EXTERNAL_ACCOUNT"
  PROVIDER_URL = "PROVIDER_URL"
  PROVIDER_KEY = "PROVIDER_KEY"
  PROVIDER_ORG = "PROVIDER_ORG"
  DATASOURCE   = "datasource-name"
  UID          = "UID"
  FOLDER       = "folder-id"
  COMPONENT    = "component-apigateway-name"
  SUBCOMPONENT = [
    "subcomponent-lambda-name"
  ]
  STATE = [
    "NameStateMachineExample"
  ]
}

```