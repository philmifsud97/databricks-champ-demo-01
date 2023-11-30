terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "5.42.0"
    }
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.5.8"
    }
  }
}

provider "github" {
  token = var.github_pat
}

provider "databricks" {

}