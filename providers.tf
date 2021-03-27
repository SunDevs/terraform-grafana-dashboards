terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "1.9.0"
    }
  }
}

provider "grafana" {
  url    = var.PROVIDER_URL
  auth   = var.PROVIDER_KEY
  org_id = var.PROVIDER_ORG
}
