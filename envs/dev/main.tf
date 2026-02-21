module "users" {
  source = "../../modules/users"
  users  = local.users

  providers = {
    databricks = databricks.account
  }
}

module "groups" {
  source   = "../../modules/groups"
  groups   = local.groups
  user_ids = module.users.user_ids # 👈 PASSING OUTPUT

  providers = {
    databricks = databricks.account
  }
}

module "metastore_grants" {
  source = "../../modules/metastore-grants"

  metastore_id         = local.metastore_id
  platform_admin_group = var.platform_admin_group

  providers = {
    databricks = databricks.workspace
  }
}

module "workspace_assignment" {
  source = "../../modules/workspace-assignment"

  workspace_id = local.workspace_id
  principals   = module.groups.group_ids

  providers = {
    databricks = databricks.account
  }
}

module "storage_credential" {
  source = "../../modules/storage-credential"

  name     = var.uc_credential
  role_arn = local.uc_iam_role_arn

  providers = {
    databricks = databricks.workspace
  }
}


