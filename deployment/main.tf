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

# replicaCount: 1

image:
  repository: us-central1-docker.pkg.dev/terraform-project-vm/artemis/artemis
  tag: "2.0.0"

service:
  port: 5000  
  
ingress:
  enabled: true
  annotations:
    ingress.kubernetes.io/ssl-redirect: "false"
    kubernetes.io/ingress.class: nginx
    cert-manager.io/cluster-issuer: letsencrypt-prod-dns01
    acme.cert-manager.io/http01-edit-in-place: "true"  

  hosts:
    - host: artemis-dev.vikmin2022.de
      paths:
        - path: /
          pathType: ImplementationSpecific
tls: 
- secretName: chart-example-tls
  hosts:
    - artemis-dev.vikmin2022.de


      EOF 

}