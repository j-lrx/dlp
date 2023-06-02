resource "google_data_loss_prevention_job_trigger" "default" {
    parent          = "projects/${var.project_id}/locations/${var.region}"
    description     = var.description
    display_name    = "${var.display_name} - job trigger"

    triggers {
        schedule {
            recurrence_period_duration = "${var.recurrence_period_duration}s"
        }
    }

    inspect_job {
        inspect_template_name = google_data_loss_prevention_inspect_template.default.id
        
        actions {
            deidentify {
                cloud_storage_output    = var.cloud_storage_output
                file_types_to_transform = var.file_types_to_transform

                transformation_config {
                    structured_deidentify_template = google_data_loss_prevention_deidentify_template.default.id
                }
            }            
        }

        storage_config {

            timespan_config {
            #    #start_time                                  = 1 #var.start_time
            #    #end_time                                    = var.end_time
                enable_auto_population_of_timespan_config   = true #var.start_time == null && var.end_time == null ? true : false
            #    timestamp_field {
            #      name = ""
            #    }
            }

            cloud_storage_options {
                file_set {
                    url     = var.cloud_storage_input
                }
                file_types  = var.file_types_to_transform
            }
       }
    }


}