resource "google_data_loss_prevention_deidentify_template" "basic" {
    parnet          = var.parent
    description     = var.description
    display_name    = var.display_name

    deidentify_config {

      record_transformations {

        field_transformations {

          dynamic fields {
            for_each = var.column_name
            content {
              name = fields.value
            }
          }
          character_mask_config {
            masking_character = "*"
          }
        }
      }
    }
    
}