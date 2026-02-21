output "user_ids" {
  value = {
    for k, u in databricks_user.this :
    u.user_name => u.id
  }
}
