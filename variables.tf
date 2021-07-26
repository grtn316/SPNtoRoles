variable "spn_list" {
  type = map(object({
    display_name         = string
    scope                = string
    role_definition_name = string
  }))
  default = {}
}
