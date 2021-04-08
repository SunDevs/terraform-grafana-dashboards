variable "PROVIDER_URL" {
  type        = string
  description = "The root URL of a Grafana server. 'https://example.grafana.net/' "
}

variable "PROVIDER_KEY" {
  type        = string
  description = "The secret key to use to access the data source."
}

variable "PROVIDER_ORG" {
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
  default = "./widgets/dashboard-grafana.tmpl"
}

variable "PANEL" {
  type    = string
  default = "./widgets/panel-row.tmpl"
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
  default     = []
}

variable "WIDGET_SUBCOMPONENT" {
  type        = list(string)
  description = "List of templates to generate panel of lambda funtions."
  default     = []
}

variable "WIDGET_STATE" {
  type        = list(string)
  description = "List of templates to generate panel of statemachines."
  default     = []
}

