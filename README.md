# Terraform Grafana Dashboards Module

Terraform Grafana Dashboards is a module for creation of dashboards and panels in grafana.

## Provision Instructions

Copy and paste into your Terraform configuration the folder **example** , insert the variables, and run **terraform init**:

The folder **example** contains:

```
- example
    - widgets
        - List of differents templates including dashboard-grafana.tmpl and panel-row.tmpl
    - example.tf
```




```bash

module "dashboard-grafana" {
  source       = "SunDevs/dashboard/grafana"
  version      = "1.0.x"
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
  WIDGET_COMPONENT = [
    "./widgets/apigateway-availability-number.tmpl",
    "./widgets/apigateway-error-rate-alert.tmpl",
    "./widgets/apigateway-remaining-budget-stacked-area.tmpl"
  ]
  WIDGET_SUBCOMPONENT = [
    "./widgets/lambda-throttle.tmpl",
    "./widgets/lambda-error-rate-alert.tmpl",
    "./widgets/lambda-error-rate-3d-alert.tmpl"
  ]
  WIDGET_STATE = [
    "./widgets/state-correctness-number.tmpl",
  ]
}

```