resource "databricks_storage_credential" "this" {
  name = var.name

  aws_iam_role {
    role_arn = var.role_arn
  }

  comment = "UC Storage Credential"
}
