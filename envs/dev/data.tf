data "terraform_remote_state" "workspace" {
  backend = "s3"
  config = {
    bucket = "thoughtbulls-dp-tf-state-763432567385"
    key    = "platform-workspace-infra/${var.region}/${var.environment}/terraform.tfstate"
    region = "ap-south-1"
  }
}

data "terraform_remote_state" "regional_bootstrap" {
  backend = "s3"
  config = {
    bucket = "thoughtbulls-dp-tf-state-763432567385"
    key    = "platform-foundation-infra/regional/${var.region}/uc-metastore/terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = true
  }
}

data "terraform_remote_state" "account_bootstrap" {
  backend = "s3"
  config = {
    bucket = "thoughtbulls-dp-tf-state-763432567385"
    key    = "platform-foundation-infra/global/account-bootstrap/${var.region}/terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = true
  }
}

