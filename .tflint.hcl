config {
    module = true
}

plugin "google" {
    enabled = true
    version = "0.17.0"
    source  = "github.com/terraform-linters/tflint-ruleset-google"
}

#
rule terraform_unused_declarations {
    enabled = true
}

#
