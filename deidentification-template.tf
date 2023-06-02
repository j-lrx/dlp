resource "google_data_loss_prevention_deidentify_template" "default" {
    parent          = "projects/${var.project_id}/locations/${var.region}"
    description     = var.description
    display_name    = "${var.display_name} - deidentification template"

    deidentify_config {

      record_transformations {

        dynamic "field_transformations" {
          for_each = var.column_to_mask != null ? [1] : 0
          content {

            dynamic fields {
              for_each = var.column_to_mask
              content {
                name = fields.value
              }
            }

            primitive_transformation {
              character_mask_config {
                masking_character = "*"
              } 
            }
          }
        }
      }
    }
}