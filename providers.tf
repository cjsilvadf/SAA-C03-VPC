provider "aws" {
  region     = local.regions.main
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY

  default_tags {
    tags = {
      Ambiente       = "Treinamento SAA-C03-A"
      TerraformCloud = "True"

    }
  }
}

provider "aws" {
  alias      = "peer"
  region     = local.regions.peer
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY

  default_tags {
    tags = {
      Ambiente       = "Treinamento SAA-C03-B"
      TerraformCloud = "True"

    }
  }
}