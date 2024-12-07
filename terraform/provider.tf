terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc6"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.prox_api_url
  pm_api_token_id     = var.prox_api_token_id
  pm_api_token_secret = var.prox_api_token_secret
  pm_tls_insecure     = true
}