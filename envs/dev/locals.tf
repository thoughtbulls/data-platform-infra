locals {
  users_yaml  = yamldecode(file("${path.module}/../../identity/users.yaml"))
  groups_yaml = yamldecode(file("${path.module}/../../identity/groups.yaml"))

  users  = local.users_yaml.users
  groups = local.groups_yaml.groups

  workspace_id    = data.terraform_remote_state.workspace.outputs.workspace_id
  metastore_id    = data.terraform_remote_state.regional_bootstrap.outputs.metastore_id
  uc_iam_role_arn = data.terraform_remote_state.account_bootstrap.outputs.uc_runtime_role_arn

}
