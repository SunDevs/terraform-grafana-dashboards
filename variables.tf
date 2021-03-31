variable "PROVIDER_URL" {
  type = string
}

variable "PROVIDER_KEY" {
  type = string
}

variable "PROVIDER_ORG" {
  type = number
}

variable "FOLDER" {
  type = number
}

variable "DATASOURCE" {
  type = string
}

variable "ACCOUNT" {
  type = string
  default = "account"
}

variable "DASHBOARD" {
  type = string
}

variable "REGION" {
  type = string
}

variable "COMPONENT" {
  type = string
}

variable "SUBCOMPONENT" {
  type    = list(string)
  default = []
}

variable "STATE" {
  type    = list(string)
  default = []
}

variable "WIDGET_COMPONENT" {
  type    = list(string)
  default = []
}

variable "WIDGET_SUBCOMPONENT" {
  type    = list(string)
  default = []
}

variable "WIDGET_STATE" {
  type    = list(string)
  default = []
}

