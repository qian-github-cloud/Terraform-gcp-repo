
// enable google computer enginer api
resource "google_project_service" "compute" {
    service = "compute.googleapis.com"
}


// enable google container engine api
resource "googe_project_service" "container" {
    service = "container.googleapis.com"
}



