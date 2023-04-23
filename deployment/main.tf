module "namespace" {
  source      = "../modules/terraform-k8s-namespace"
  name        = "${var.app_name}-${var.environment}"
  labels      = var.namespace_labels
  annotations = var.namespace_annotations
}


module "application" {
  source        = "../modules/terraform-helm-local"
  app_name      = "${var.app_name}-${var.environment}"
  app_namespace = module.namespace.namespace
  app_path      = "../charts/application"
  values_yaml   = <<EOF
image:
  repository: "${var.repository}"
  tag: "${var.app_version}"

service:
  port: "${var.port}"

ingress:
  enabled: true
  annotations: 
    ingress.kubernetes.io/ssl-redirect: "false"
    kubernetes.io/ingress.class: nginx
    cert-manager.io/cluster-issuer: letsencrypt-prod-dns01
    acme.cert-manager.io/http01-edit-in-place: "true"
  hosts:
    - host: "${var.app_name}-${var.environment}.${var.domain}"
      paths:
        - path: /
          pathType: ImplementationSpecific
  tls: 
  - secretName: "${var.app_name}-tls"
    hosts:
      - "${var.app_name}-${var.environment}.${var.domain}"
    EOF
}