terraform {
  backend "gcs" {
    bucket = "tf-state-load-testing-<YOUR_GCP_PROJECT_ID>"
  }
}

module "load-testing-cluster" {
  source     = "../modules"
  env        = "dev"
  project_id = "<YOUR_GCP_PROJECT_ID>"
}
