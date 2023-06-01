#
# Inspection template 
#
variable "parent" {
    type = string
}

variable "deidentify_template_description" {
    type = string
    default = "Template d'anonimistion de données"
}

variable "deidentify_template_display_display_name" {
    type = string  
}

variable "column_name" {
    type = list(string)
}

variable "trigge_description" {
    type = string
    default = "déidentification job trigger"
}

variable "trigger_display_name" {
    type = string  
}

variable "inspection_template_display_name" {
    type = string  
}


variable "input_bucket" {
    type = string  
}


variable "input_path" {
    type = string  
}