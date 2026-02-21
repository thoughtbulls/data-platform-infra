resource "databricks_mws_permission_assignment" "users" {

  for_each = var.principals

  workspace_id = var.workspace_id
  principal_id = each.value
  permissions  = ["USER"]
}
