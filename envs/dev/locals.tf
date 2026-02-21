locals {
  users_yaml  = yamldecode(file("${path.module}/../../identity/users.yaml"))
  groups_yaml = yamldecode(file("${path.module}/../../identity/groups.yaml"))

  users  = local.users_yaml.users
  groups = local.groups_yaml.groups

  metastore_id    = data.terraform_remote_state.bootstrap.outputs.metastore_id
  workspace_id    = data.terraform_remote_state.infra.outputs.workspace_id
  uc_iam_role_arn = data.terraform_remote_state.bootstrap.outputs.uc_storage_role_arn
}
