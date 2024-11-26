resource "google_compute_instance" "default" {
  name         = "jenkins-server"
  machine_type = "e2-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }

    // Apply the firewall rule to allow external IPs to access this instance
    tags = ["http-server"]
}
resource "google_compute_firewall" "http-server" {
  name    = "default-allow-http-jenkins"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "22"]
  }

  // Allow traffic from everywhere to instances with an http-server tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}

output "ip" {
  value = "${google_compute_instance.default.network_interface.0.access_config.0.nat_ip}"
}