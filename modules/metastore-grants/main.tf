resource "databricks_grants" "metastore" {

  metastore = var.metastore_id

  grant {
    principal  = var.platform_admin_group
    privileges = ["CREATE_CATALOG"]
  }
}
