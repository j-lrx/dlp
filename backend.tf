terraform {
  cloud {
    organization = "j-lrx"

    workspaces {
      name = "deploy-master"
    }
  }
} 