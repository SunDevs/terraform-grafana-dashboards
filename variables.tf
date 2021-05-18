variable "GRAFANA_URL" {
  type        = string
  description = "The root URL of a Grafana server. 'https://example.grafana.net/' "
}

variable "GRAFANA_AUTH" {
  type        = string
  description = "The secret key to use to access the data source."
}

variable "GRAFANA_ORG_ID" {
  type        = number
  description = "The organization id to operate on within grafana. Default is 1."
}

variable "FOLDER" {
  type        = number
  description = "The internal id of the folder in Grafana in which to place the dashboard."
}

variable "DATASOURCE" {
  type        = string
  description = "The name of the data source in Grafana server."
}

variable "ACCOUNT" {
  type        = string
  description = "External account to configure statemachine arn"
}

variable "DASHBOARD" {
  type    = string
  default = "widgets/dashboard-grafana.tmpl"
}

variable "PANEL" {
  type    = string
  default = "widgets/panel-row.tmpl"
}

variable "UID" {
  type        = string
  description = "Notification channel identifier in Grafana."
}

variable "REGION" {
  type = string
}

variable "COMPONENT" {
  type        = string
  description = "Name of apigateway to generate panels."
}

variable "SUBCOMPONENT" {
  type        = list(string)
  description = "List of lambdas to generate panels."
  default     = []
}

variable "STATE" {
  type        = list(string)
  description = "List of statemachines to generate panels."
  default     = []
}

variable "WIDGET_COMPONENT" {
  type        = list(string)
  description = "List of templates to generate panel of apigateway."
  default = [
    "widgets/apigateway-latency.tmpl",
    "widgets/apigateway-remaining-budget-stacked-area.tmpl",
    "widgets/apigateway-availability-stacked-area.tmpl",
    "widgets/apigateway-availability-number.tmpl",
    "widgets/apigateway-error-rate-3d-alert.tmpl",
    "widgets/apigateway-error-rate-alert.tmpl",
    "widgets/apigateway-error-budget-number.tmpl",
    "widgets/apigateway-remaining-budget-number.tmpl",
    "widgets/apigateway-request-budget-number.tmpl"
  ]
}

variable "WIDGET_SUBCOMPONENT" {
  type        = list(string)
  description = "List of templates to generate panel of lambda funtions."
  default = [
    "widgets/lambda-throttle.tmpl",
    "widgets/lambda-latency.tmpl",
    "widgets/lambda-availability-number.tmpl",
    "widgets/lambda-availability-stacked-area.tmpl",
    "widgets/lambda-error-rate-alert.tmpl",
    "widgets/lambda-error-rate-3d-alert.tmpl"
  ]
}

variable "WIDGET_STATE" {
  type        = list(string)
  description = "List of templates to generate panel of statemachines."
  default = [
    "widgets/state-correctness-number.tmpl",
    "widgets/state-correctness-stacked-area.tmpl",
    "widgets/state-throttle.tmpl",
    "widgets/state-error-budget-number.tmpl",
    "widgets/state-remaining-budget-number.tmpl",
    "widgets/state-remaining-budget-stacked-area.tmpl",
    "widgets/state-error-rate-3d-alert.tmpl",
    "widgets/state-error-rate-alert.tmpl"
  ]
}

variable "SLO" {
  type        = number
  description = "Level of SLO in your service example: 99.9"
  default     = 99.9
}
