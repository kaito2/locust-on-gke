module "gke" {
  source  = "terraform-google-modules/kubernetes-engine/google//modules/beta-public-cluster"
  version = "v12.1.0"

  cluster_autoscaling = {
    autoscaling_profile = "OPTIMIZE_UTILIZATION"
    enabled             = true
    max_cpu_cores       = 200
    max_memory_gb       = 300
    min_cpu_cores       = 0
    min_memory_gb       = 0
  }

  grant_registry_access = true
  ip_range_pods         = local.ip_range_pods_name
  ip_range_services     = local.ip_range_services_name
  name                  = "load-testing-cluster-${var.env}"
  network               = module.vpc.network_name
  node_pools = [
    {
      machine_type = "n2-standard-2"
      name         = "default-node-pool"
      preemptible  = true
    }
  ]
  project_id               = var.project_id
  region                   = local.region
  remove_default_node_pool = true
  subnetwork               = local.subnet_name
}
