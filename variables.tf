#
# Common
#
variable "parent" {
    type = string
}
variable "region" {
    type = string  
    default ="europe-west9"
}
variable "google-creds" {
    type = string  
}

#
# Inspection template 
#

variable "inspection_template_display_name" {
    type = string  
}


#
# Deidentification template
#
variable "deidentify_template_display_display_name" {
    type = string  
}
variable "deidentify_template_description" {
    type = string
    default = "Template d'anonimistion de données"
}
variable "column_name" {
    type = list(string)
}

#
# Trigger Job
#
variable "trigger_display_name" {
    type = string  
}
variable "trigger_description" {
    type = string
    default = "déidentification job trigger"
}
variable "input_bucket" {
    type = string  
}
variable "output_bucket" {
    type = string  
}