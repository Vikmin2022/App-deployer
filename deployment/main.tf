module "namespace" {
  source = "../modules/terraform-k8s-namespace"
  name   = "test"
  labels = {
    env = "test"
  }
  annotations = {
    env = "test"
  }
}

module "application" {
  source               = "../modules/terraform-helm-local"
  deployment_name      = "artemis"
  deployment_namespace = "test"
  deployment_path      = "../charts/application"
  values_yaml          = <<EOF
      EOF 

}