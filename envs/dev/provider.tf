terraform {
  required_providers {
    # aws = {
    #   source  = "hashicorp/aws"
    #   version = "~> 6.0"
    # }

    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.30"
    }
  }
}

provider "databricks" {
  alias      = "account"
  host       = "https://accounts.cloud.databricks.com"
  account_id = var.databricks_account_id
}

provider "databricks" {
  alias = "workspace"
  host  = var.workspace_host
}
