resource "google_data_loss_prevention_deidentify_template" "default" {
    parent          = "projects/${var.project_id}/locations/${var.region}"
    description     = var.description
    display_name    = "${var.display_name} - deidentification template"

    deidentify_config {

      dynamic "record_transformations" {
        for_each = var.input_source_type == "TABLE" ? 
        content {

          ###################################################
          #              Masquage de colonne                #
          ###################################################
          field_transformations {


              dynamic fields {
                for_each = var.column_to_mask != null ? [length(var.column_to_mask)] : [0]
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

          ###################################################
          #     Anonymisation table par crypto réversible   #
          ###################################################
          dynamic "field_transformations" {
            for_each = var.column_to_mask != null ? [1] : [0]
            content {

              dynamic fields {
                for_each = var.column_to_crypto_deterministic != null ? [length(var.column_to_crypto_deterministic)] : [0]
                content {
                  name = fields.value
                }
              }

              primitive_transformation {
                crypto_deterministic_config {
                  crypto_key {
                    transient {
                      name = "key-${random_integer.random_int.result}"
                    }
                  }
                }          
              }
            }
          }
        }
        :
        content{
      


            info_type_transformations {

                ###################################################
                #        Remplacement texte par info_type         #
                ###################################################
                dynamic "transformations" {
                    for_each = var.text_to_info_type != null ? [1] : [0]
                    content {

                        dynamic "info_types" {
                            for_each = var.text_to_info_type != null ? [length(var.text_to_info_type)] : [0]
                            content {
                                name = info_types.value
                            }
                        }   
            

                        primitive_transformation {
                            replace_with_info_type_config = true
                        }
                    }
                }
            }
            
        }
    }
}