variable "app_name" {
  type        = string
  description = "- (Required) Chart release name."
}

variable "app_namespace" {
  type        = string
  default     = "default"
  description = "- (Optional) Namespace where to deploy resources to."
}

variable "app_path" {
  type        = string
  description = "- (Required) Path for the Chart."
}

variable "values_yaml" {
  type        = string
  description = "- (Required) Values.yaml file."
}