provider "github" {
  owner = "tejadevsecops"
}


terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}


variable "repos" {
  default = {
    "roboshop-cart"      = {}
    "roboshop-catalogue" = {}
    "roboshop-user"      = {}
    "roboshop-shipping"  = {}
    "roboshop-payment"   = {}
    "roboshop-frontend"  = {}
  }
}

variable "env" {
  default = {
    "E2E-TESTS"  = {}
    "QA"   = {}
    "UAT"  = {}
    "PROD" = {}
  }
}

locals {
  repos_with_envs    = { for i, j in var.repos : i => { for x, y in var.env : "${i}_${x}" => { "env" = x, "app" = i } } }
  repo_with_env_list = flatten([for a, b in local.repos_with_envs : values(b)])
}


data "github_user" "user" {
  username = "Theja727"
}

resource "github_repository_environment" "env" {
  count               = length(local.repo_with_env_list)
  environment         = local.repo_with_env_list[count.index]["env"]
  repository          = local.repo_with_env_list[count.index]["app"]
  prevent_self_review = false
  reviewers {
    users = [data.github_user.user.id]
  }
}