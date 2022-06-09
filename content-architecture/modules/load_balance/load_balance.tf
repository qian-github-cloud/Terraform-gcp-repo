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
resource "google_compute_backend_service" "this" {
  name = var.backend_service_name
  backend {
    group = var.instance_group_manager_name
  }
  health_checks = var.health_check_name
}

resource "google_compute_url_map" "this" {
  name            = var.url_map_name
  default_service = google_compute_backend_service.this.self_link
}
resource "google_compute_target_https_proxy" "dev" {
  name             = var.https_proxy_name
  ssl_certificates = [google_compute_ssl_certificate.dev.id]
  url_map          = google_compute_url_map.this.id
}


resource "google_compute_global_forwarding_rule" "this" {
  name       = var.forwarding_rule_name
  target     = google_compute_target_https_proxy.dev.self_link
  port_range = var.port_range
}

resource "google_compute_ssl_certificate" "dev" {
  private_key = tls_private_key.this.private_key_pem
  certificate = tls_self_signed_cert.this.cert_pem
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

  dns_names = var.dns_names
  subject {
    common_name = var.common_name

  }

}
