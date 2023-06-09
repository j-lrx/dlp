# Common
project_id   = "julien-le-roux-389215"
display_name = "Test export anonimysé"

# Job trigger
cloud_storage_input                       = "gs://input-bucket-op"
cloud_storage_output                      = "gs://output-bucket-op"
enable_auto_population_of_timespan_config = false

# deidentification template
input_source_type = "TABLE"
column_to_mask       = ["Nom", "Prénom", "société"]