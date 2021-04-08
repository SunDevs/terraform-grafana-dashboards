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
