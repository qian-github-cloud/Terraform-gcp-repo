resource "google_container_cluster" "dev"{
    name = var.cluster_name
    location = var.region
    remove_default_node_pool = true
    initial_node_count = var.node_count

    network = google_compute_network.dev.self_link
    subnetwork = google_compute_subnetwork.dev.self_link

    logging_service = "logging.googleapis.com/kubernetes"
    monitoring_service = "monitoring.googleapis.com/kubernetes"
    network_mode = "VPC_NATIVE"

    addons_config{
        http_load_balancing {
            disabled = true
        }
        horizontal_pod_autoscaling{
            disabled = true
        }
    }

    release_channel{
        channel = "REGULAR"
    }

    workload_identity_config{
        workload_pool = "devops-v4.svc.id.goog"
    }
}