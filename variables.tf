##########
# Common #
##########
variable "project_id" {
    type        = string
    nullable    = false
}
variable "region" {
    type = string  
    default ="europe-west1"
    validation{
        condition = var.region == "europe-west1" || var.region == "europe-west9"
        error_message = "Région disponible : europe-west1 ou europe-west9"
    }
}
variable "google-creds" {
    type = string  
}

variable "description" {
    type        = string
    nullable    = true
    default     = null
}

variable "display_name" {
    type    = string
    default = "Export de données anonymisées"  
}

###############
# Job trigger #
###############

variable "recurrence_period_duration" {
    type        = number
    default     = "86400" # 1 journée
    nullable    = false
}

variable "cloud_storage_output" {
    type        = string
    nullable    = false
}

variable "file_types_to_transform" {
    type        = list(string)
    default     = ["TEXT_FILE","CSV","TSV"]
}

variable "cloud_storage_input" {
    type        = string
    nullable    = false
}

variable "start_time" {
    default  = null
    nullable = true
}

variable "end_time" {
    default  = null
    nullable = true
}

variable "enable_auto_population_of_timespan_config" {
    default = true
}

