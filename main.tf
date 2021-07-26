resource "azuread_application" "app_reg" {
  for_each     = var.spn_list
  display_name = each.value.display_name
}

resource "azuread_service_principal" "spn" {
  for_each       = var.spn_list
  application_id = azuread_application.app_reg[each.key].application_id
}

resource "azurerm_role_assignment" "assignment" {
  for_each             = var.spn_list
  scope                = each.value.scope
  role_definition_name = each.value.role_definition_name
  principal_id         = azuread_service_principal.spn[each.key].object_id
}