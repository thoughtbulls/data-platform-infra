output "user_ids" {
  value = {
    for k, u in data.databricks_user.users :
    u.user_name => u.id
  }
}
