resource "google_storage_bucket" "input_bucket" {
  name          = "input-bucket-op"
  location      = var.region
  uniform_bucket_level_access = true
}

resource "google_storage_bucket" "output_bucket" {
  name          = "output-bucket-op"
  location      = var.region
  uniform_bucket_level_access = true
}