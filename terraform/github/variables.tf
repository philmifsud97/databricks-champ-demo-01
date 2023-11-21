variable "github_org_url" {
  description = "Github URL"
  type        = string
}

variable "github_pat" {
  description = "string PAT"
  type        = string
}

variable "databricks_pat" {
  description = "string PAT"
  type        = string
}

variable "github_user_name" {
  description = "string User Name"
  type        = string
}

variable "github_repo" {
  description = "Repo name in string"
  type        = string
  default     = "databricks-champ-demo-01-tf"
}

variable "cluster_prefix" {
    description = "cluster name prefix"
    type = string 
    default = "Databricks Champ Demo 01 TF"
}


