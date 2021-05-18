locals {

  LIST_COMPONENT    = setproduct([var.COMPONENT], var.WIDGET_COMPONENT)
  LIST_SUBCOMPONENT = setproduct(var.SUBCOMPONENT, var.WIDGET_SUBCOMPONENT)
  LIST_STATE        = setproduct(var.STATE, var.WIDGET_STATE)

  ERROR_RATE_THRESHOLD = {
    onehour : 14.4 * (100 - var.SLO) / 100,
    sixhour : 6 * (100 - var.SLO) / 100,
    threeday : 1 * (100 - var.SLO) / 100
  }


  ID_API = 1
  ID_LAM = 30
  ID_STM = 80

  source_dashboard = local.source_body

  source_body = jsondecode(templatefile("${path.module}/${var.DASHBOARD}", {
    COMPONENT = "${var.COMPONENT}-${var.FOLDER}",
    PANELS    = jsonencode(local.source_panels),
    SLO       = var.SLO
  }))

  source_panels = concat(local.source_row_component, local.source_row_subcomponent, local.source_row_state)

  source_row_component = [
    jsondecode(templatefile("${path.module}/${var.PANEL}", {
      TITLE  = "APIGATEWAY",
      ID     = 23,
      X      = 0,
      Y      = 0,
      PANELS = jsonencode(local.source_component)
    }))
  ]

  source_row_subcomponent = [

    jsondecode(templatefile("${path.module}/${var.PANEL}", {
      TITLE  = "LAMBDA",
      ID     = 25,
      X      = 0,
      Y      = 1,
      PANELS = jsonencode(local.source_subcomponent)
    }))
  ]

  source_row_state = [
    jsondecode(templatefile("${path.module}/${var.PANEL}", {
      TITLE  = "STATEMACHINE",
      ID     = 27,
      X      = 0,
      Y      = 2,
      PANELS = jsonencode(local.source_state)
    }))
  ]

  source_component = [

    for INDEX in range(0, length(local.LIST_COMPONENT)) :
    jsondecode(templatefile("${path.module}/${local.LIST_COMPONENT[INDEX][1]}", {
      REGION               = var.REGION,
      RESOURCE             = local.LIST_COMPONENT[INDEX][0],
      DATASOURCE           = var.DATASOURCE,
      ERROR_RATE_THRESHOLD = local.ERROR_RATE_THRESHOLD,
      ID                   = sum([local.ID_API, INDEX]),
      UID                  = var.UID,
      X                    = (INDEX + 1) % 3 == 0 ? 16 : (INDEX + 1) % 2 == 0 ? 8 : 0,
      Y                    = 0
    }))

  ]

  source_subcomponent = [

    for INDEX in range(0, length(local.LIST_SUBCOMPONENT)) :
    jsondecode(templatefile("${path.module}/${local.LIST_SUBCOMPONENT[INDEX][1]}", {
      REGION               = var.REGION,
      DATASOURCE           = var.DATASOURCE,
      RESOURCE             = local.LIST_SUBCOMPONENT[INDEX][0],
      ERROR_RATE_THRESHOLD = local.ERROR_RATE_THRESHOLD,
      ID                   = sum([local.ID_LAM, INDEX]),
      UID                  = var.UID,
      X                    = (INDEX + 1) % 3 == 0 ? 16 : (INDEX + 1) % 2 == 0 ? 8 : 0,
      Y                    = 12
    }))

  ]

  source_state = [

    for INDEX in range(0, length(local.LIST_STATE)) :
    jsondecode(templatefile("${path.module}/${local.LIST_STATE[INDEX][1]}", {
      REGION               = var.REGION,
      ACCOUNT              = var.ACCOUNT,
      DATASOURCE           = var.DATASOURCE,
      RESOURCE             = local.LIST_STATE[INDEX][0],
      ERROR_RATE_THRESHOLD = local.ERROR_RATE_THRESHOLD,
      ID                   = sum([local.ID_STM, INDEX]),
      UID                  = var.UID,
      X                    = (INDEX + 1) % 3 == 0 ? 16 : (INDEX + 1) % 2 == 0 ? 8 : 0,
      Y                    = 12
    }))
  ]
}

resource "grafana_dashboard" "main" {
  config_json = jsonencode(local.source_dashboard)
  folder      = var.FOLDER
}
