resource "google_data_loss_prevention_inspect_template" "default" {
    parent          = "projects/julienleroux"

    inspect_config {
      content_options = []
      exclude_info_types = false
      include_quote = false
    }
}