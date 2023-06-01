resource "google_data_loss_prevention_inspect_template" "default" {
    parent          = var.parent
    display_name    = var.inspection_template_display_name

    inspect_config {
      
    }
}

output "id" {
  value = google_data_loss_prevention_inspect_template.default.id
}

output "name" {
  value = google_data_loss_prevention_inspect_template.default.name
}