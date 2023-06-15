resource "google_data_loss_prevention_deidentify_template" "table" {
  parent       = "projects/${var.project_id}/locations/${var.region}"
  description  = var.description
  display_name = "${var.display_name} - deidentification template"

  deidentify_config {

    dynamic "record_transformations" {
      for_each = var.input_source_type == "TABLE" ? [1] : [0]
      content {

        ###################################################
        #              Masquage de colonne                #
        ###################################################
        dynamic "field_transformations" {
          for_each = var.column_to_mask != null ? [1] : [0]
          content {

            dynamic "fields" {
              for_each = toset(var.column_to_mask) != null ? [length(var.column_to_mask)] : [0]
              content {
                name = var.column_to_mask[fields.value]
              }
            }

            primitive_transformation {
              character_mask_config {
                masking_character = "*"
              }
            }
          }
        }

        ###################################################
        #     Anonymisation table par crypto réversible   #
        ###################################################
        /*dynamic "field_transformations" {
          for_each = var.column_to_crypto_deterministic != null ? [1] : [0]
          content {

            dynamic "fields" {
              for_each = var.column_to_crypto_deterministic != null ? [length(var.column_to_crypto_deterministic)] : [0]
              content {
                name = fields.value
              }
            }

            primitive_transformation {
              crypto_deterministic_config {
                crypto_key {
                  kms_wrapped {
                    wrapped_key = "c3lzdGVtZVU="
                    crypto_key_name = "key-${random_integer.random_int.result}"
                  }
                }
              }
            }
          }
        }*/
      }
    }
  }
}

resource "google_data_loss_prevention_deidentify_template" "texte" {
  parent       = "projects/${var.project_id}/locations/${var.region}"
  description  = "toto"
  display_name = "${var.display_name} - deidentification template2"

  deidentify_config {

    dynamic "info_type_transformations" {
      for_each = var.input_source_type == "TEXTE" ? [1] : [0]
      content {

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
