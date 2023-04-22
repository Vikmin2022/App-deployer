
resource "helm_release" "helm_deployment" {
  name      = var.app_name
  namespace = var.app_namespace
  chart     = var.app_path
  wait      = false
  values = [
    var.values_yaml
  ]
}
