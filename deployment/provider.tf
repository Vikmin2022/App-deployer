provider "helm" {
  experiments { # checks helm content, and applies 
    manifest = true
  }
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}