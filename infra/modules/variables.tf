// common
variable "project_id" {}
variable "env" {}
locals {
  region = "asia-northeast1"
}

// network
locals {
  network_name           = "load-testing-vpc"
  subnet_name            = "load-testing-subnet"
  ip_range_pods_name     = "ip-range-pods"
  ip_range_services_name = "ip-range-services"
}
