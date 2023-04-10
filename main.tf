terraform {
  cloud {
    hostname = "safe-corgi.tf-support.hashicorpdemo.com"
    organization = "example-org"

    workspaces {
      name = "agent-pls"
    }
  }
}

module "module" {
  source  = "localterraform.com/example-org/module/null"
  version = "1.0.0"
}

# no op
provider "null" {
  # Configuration options
}
variable "favorite_color" {
  default = "blue"
}

locals {
  favorite_fruit = "banana"
}

output "favorite_color" {
  value = var.favorite_color
}

resource "null_resource" "get_tf_env" {
  provisioner "local-exec" {
    command = "env"
    interpreter = ["bash", "-c"]
  }
}
