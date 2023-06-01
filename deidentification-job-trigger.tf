resource "google_data_loss_prevention_job_trigger" "default" {
    parent          = var.parent
    description     = var.trigger_description
    display_name    = var.trigger_display_name

    triggers {
        schedule {
            recurrence_period_duration = "86400s"
        }
    }

    inspect_job {
        inspect_template_name = "projects/julienleroux/locations/global/dlpJobs/i-test"
        
        actions {
            deidentify {
                cloud_storage_output = var.output_bucket

                transformation_config {
                    deidentify_template = google_data_loss_prevention_deidentify_template.default.name
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