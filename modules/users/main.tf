# resource "databricks_user" "this" {
#   for_each = var.users

#   user_name = each.value.email
#   display_name = each.value.display_name

#   workspace_access = true
#   databricks_sql_access = true
# }

resource "null_resource" "create_users" {
  for_each = var.users

  provisioner "local-exec" {
    command = "bash ../../scripts/create_users.sh ${each.value.email}"
  }
}

data "databricks_user" "users" {
  depends_on = [null_resource.create_users]
  for_each   = var.users
  user_name  = each.value.email
}