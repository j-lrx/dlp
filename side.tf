resource "google_storage_bucket" "input_bucket" {
  name                        = "input-bucket-op"
  location                    = "europe-west9"
  uniform_bucket_level_access = true
  force_destroy               = true
}

resource "google_storage_bucket" "output_bucket" {
  name                        = "output-bucket-op"
  location                    = "europe-west9"
  uniform_bucket_level_access = true
  force_destroy               = true
}

resource "google_storage_bucket_object" "table" {
  name    = "table.csv"
  content = "Prénom,Nom,Téléphone,société\nJulien,Le Roux,06 12 34 56 67,onepoint\nYann,Mitreau,07 12 34 56 67,système U\nAlexis,Morelle,06 76 65 43 32,wescale\n"
  bucket  = google_storage_bucket.input_bucket.name
}