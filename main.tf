provider "google" {
  project = "barbero-devops-iac"
  region  = "us-central1"
  zone    = "us-central1-c"
  credentials = "${file("serviceaccount.yaml")}"
}

resource "google_folder" "Comercial" {
  display_name = "Comercial"
  parent       = "organizations/540829645030"
}

resource "google_folder" "Mobile" {
  display_name = "Mobile"
  parent       = google_folder.Comercial.name
}

resource "google_folder" "Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.Mobile.name
}

resource "google_folder" "Producao" {
  display_name = "Producao"
  parent       = google_folder.Mobile.name
}


resource "google_folder" "ERP" {
  display_name = "ERP"
  parent       = google_folder.Comercial.name
}

resource "google_folder" "Desenvolvimento" {
  display_name = "Desenvolvimento"
  parent       = google_folder.ERP.name
}

resource "google_folder" "Producao" {
  display_name = "Producao"
  parent       = google_folder.ERP.name
}
