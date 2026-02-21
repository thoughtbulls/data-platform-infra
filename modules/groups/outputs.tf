output "group_ids" {
  value = {
    for k, g in databricks_group.this :
    k => g.id
  }
}
