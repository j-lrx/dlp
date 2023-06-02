resource "google_data_loss_prevention_inspect_template" "default" {
    parent          = "projects/${var.project_id}/locations/${var.region}"
    description     = var.description
    display_name    = "${var.display_name} - inspection template"

    inspect_config {
      
    }
}

output "id" {
  value = google_data_loss_prevention_inspect_template.default.id
}

output "name" {
  value = google_data_loss_prevention_inspect_template.default.name
}