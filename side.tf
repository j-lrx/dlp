resource "google_storage_bucket" "input_bucket" {
  name          = "input-bucket-op"
  region = "europe-west9"
  location      = var.region
  uniform_bucket_level_access = true
  force_destroy = true
}

resource "google_storage_bucket" "output_bucket" {
  name          = "output-bucket-op"
  region = "europe-west9"
  location      = var.region
  uniform_bucket_level_access = true
  force_destroy = true
}

resource "google_storage_bucket_object" "table" {
  name    = "table.csv"
  content ="Prénom,Nom,Téléphone,société\nJulien,Le Roux,06 12 34 56 67,onepoint\nYann,Mitreau,07 12 34 56 67,système U\nFlorian,Grignon,06 76 65 43 32,indep"
  bucket  = google_storage_bucket.input_bucket.name
}