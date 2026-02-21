resource "databricks_user" "this" {
  for_each = var.users

  user_name = each.value.email
  display_name = each.value.display_name

  workspace_access = true
  databricks_sql_access = true
}