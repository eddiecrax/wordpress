provider "google" {
  project     = "forthbrand-website-project"
  region      = "us-central1"
  credentials = file("credentials = file("C:\Users\eduar\OneDrive\Desktop\forthbrand-website-project-c95519f0d57b.json")
")
}

resource "google_storage_bucket" "website_bucket" {
  name          = "forthbrand-website-bucket"
  location      = "US"
  force_destroy = true

  website {
    main_page_suffix = "index.html"
    not_found_page   = "404.html"
  }
}
