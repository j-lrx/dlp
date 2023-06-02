# Common
project_id   = "julienleroux"
display_name = "Test export anonimysé"

# Job trigger
cloud_storage_input  = "gs://input-bucket-op"
cloud_storage_output = "gs://output-bucket-op"

# deidentification template
column_to_mask       = ["Nom", "Prénom", "société"]
