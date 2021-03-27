locals {

  LIST_COMPONENT    = setproduct([var.COMPONENT], var.WIDGET_COMPONENT)
  LIST_SUBCOMPONENT = setproduct(var.SUBCOMPONENT, var.WIDGET_SUBCOMPONENT)
  LIST_STATE        = setproduct(var.STATE, var.WIDGET_STATE)

  source_dashboard = local.source_body

  source_body = jsondecode(templatefile(var.DASHBOARD, {
    COMPONENT = var.COMPONENT,
    PANELS    = jsonencode(local.source_panels)
  }))

  source_panels = concat(local.source_component, local.source_subcomponent, local.source_state)

  source_component = [

    for INDEX in range(0, length(local.LIST_COMPONENT)) :
    jsondecode(templatefile(local.LIST_COMPONENT[INDEX][1], {
      REGION   = var.REGION,
      RESOURCE = local.LIST_COMPONENT[INDEX][0]
      X        = (INDEX + 1) % 3 == 0 ? 16 : (INDEX + 1) % 2 == 0 ? 8 : 0
      Y        = 0
    }))

  ]

  source_subcomponent = [

    for INDEX in range(0, length(local.LIST_SUBCOMPONENT)) :
    jsondecode(templatefile(local.LIST_SUBCOMPONENT[INDEX][1], {
      REGION   = var.REGION,
      RESOURCE = local.LIST_SUBCOMPONENT[INDEX][0]
      X        = (INDEX + 1) % 3 == 0 ? 16 : (INDEX + 1) % 2 == 0 ? 8 : 0
      Y        = 12
    }))

  ]

  source_state = [

    for INDEX in range(0, length(local.LIST_STATE)) :
    jsondecode(templatefile(local.LIST_STATE[INDEX][1], {
      REGION   = var.REGION,
      ACCOUNT  = var.ACCOUNT,
      RESOURCE = local.LIST_STATE[INDEX][0]
      X        = (INDEX + 1) % 3 == 0 ? 16 : (INDEX + 1) % 2 == 0 ? 8 : 0
      Y        = 12
    }))
  ]
}

resource "grafana_dashboard" "main" {
  config_json = jsonencode(local.source_dashboard)
  //config_json = "${file("widgets/dashboard-grafana.json")}"
  folder     = var.FOLDER
}
