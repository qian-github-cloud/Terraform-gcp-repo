// vpn module
resource "google_compute_network" "dev"{
    name = "test-kubernetes-vpn"
    routing_mode = "REGIONAL"
    auto_create_subnetworks = false
    mtu = 1450
    
    depends_on = [
        google_project_service.compute,
        google_project_service.container,
    ]
}