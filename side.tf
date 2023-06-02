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

resource "google_storage_bucket_object" "table" {
  name    = "table.csv"
  content ="Prénom,Nom,Téléphone,société
  Julien,Le Roux,06 12 34 56 67,onepoint
  Yann,Mitreau,07 12 34 56 67,système U
  Florian,Grignon,06 76 65 43 32,indep"
  bucket  = google_storage_bucket.input_bucket.name
}