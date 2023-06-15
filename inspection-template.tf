resource "google_data_loss_prevention_inspect_template" "default" {
  parent       = "projects/${var.project_id}/locations/${var.region}"
  description  = var.description
  display_name = "${var.display_name} - inspection template"

  inspect_config {
    info_types {
            name = "EMAIL_ADDRESS"
        }
        info_types {
            name = "DATE"
        }
        info_types {
            name = "FIRST_NAME"
        }
  }
}

output "id" {
  value = google_data_loss_prevention_inspect_template.default.id
}

output "name" {
  value = google_data_loss_prevention_inspect_template.default.name
}