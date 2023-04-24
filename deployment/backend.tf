terraform {
  backend "gcs" {
    bucket = "terraform-project-vm-bucket"
    prefix = "/dev/mnt/Vikmin2022/project_infrastructure/deployment"
  }
}
