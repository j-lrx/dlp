resource "google_data_loss_prevention_deidentify_template" "default" {
    parent          = var.parent
    description     = var.deidentify_template_description
    display_name    = var.deidentify_template_display_display_name

    deidentify_config {

      record_transformations {

        field_transformations {

          #dynamic fields {
          #  for_each = var.column_name
          #  content {
          #    name = fields.value
          #  }
          #}
          fields {
          #  name = "Nom"
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