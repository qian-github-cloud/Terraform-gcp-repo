// about Global external HTTPS load balancer
//https://cloud.google.com/load-balancing/docs/https
//1. proxy-only subnet
//2. external forwarding rule
//3. target https proxy
//4. SSL certificate
//5. URL map
//6. backend service
//7. health check
//8. firewall rule






resource "google_compute_health_check" "this" {
  name = var.health_check_name
  http_health_check {
    port = 80
  }
}


resource "google_compute_backend_service" "this" {

}

resource "google_compute_url_map" "this" {
  name = var.url_map_name

}
resource "google_compute_target_https_proxy" "dev" {
  name             = var.https_proxy_name
  ssl_certificates = [google_compute_ssl_certificate.cert.id]
  url_map          = google_compute_url_map.this.id
}

resource "google_compute_ssl_certificate" "dev" {
  private_key = tls_private_key.this.private_key_pem
  certificate = tls_certificate.this.certificate_pem
  name        = var.certificate_name
  lifecycle {
    create_before_destroy = true
  }
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "tls_self_signed_cert" "this" {
  private_key_pem       = tls_private_key.this.private_key_pem
  validity_period_hours = 12
  allowed_uses = [
    "key_encipherment",
    "digital_signature",
    "server_auth",
  ]
}
