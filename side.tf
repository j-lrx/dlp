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
  content = "Prénom,Nom,Colonne3,société\nJulien,Le Roux,+336 12 34 56 67,onepoint\nYann,Mitreau,+337 12 34 56 67,système U\nAlexis,Morelle,+336 76 65 43 32,wescale\n"
  bucket  = google_storage_bucket.input_bucket.name
}

resource "google_storage_bucket_object" "texte" {
  name    = "texte.txt"
  content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\n julien, né le 30/01/1988 est agé de 35 ans\n sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  bucket  = google_storage_bucket.input_bucket.name
}