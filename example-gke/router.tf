resource "google_computer_router" "dev" {
    name = "dev-router"
    region = var.region
    network = google_compute_network.dev.id

}

