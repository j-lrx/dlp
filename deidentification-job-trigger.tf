resource "google_data_loss_prevention_job_trigger" "default" {
    parent          = var.parent
    description     = var.trigger_description
    display_name    = var.trigger_display_name

    triggers {
        schedule {
          recurecurrence_period_duration = "1" 
        }
    }

    inspect_job {
        inspect_template_name = var.inspection_template_display_name
        
        actions {
            deidentify {
                cloud_storage_output = var.output_bucket

                transformation_config {
                    deidentify_template = var.deidentify_template_display_display_name
                }
            }            
        }

        storage_config {
            cloud_storage_options {
                file_set {
                    url = var.input_bucket
                }
            }
       }
    }


}