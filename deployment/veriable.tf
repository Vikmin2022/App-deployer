variable "namespace" {
  type = string
}
variable "namespace_labels" {
  type = map(any)
}
variable "namespace_annotations" {
  type = map(any)
}


variable "repository" {}
variable "tag" {}
variable "port" {}
variable "domain" {}
variable "environment" {}