variable "path" {
  type = string
}

variable "discobery_url" {
  type = string
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type      = string
  sensitive = true
}

variable "policies" {
  type    = list(string)
  default = ["default"]
}

variable "vault_host" {
  type = string
}
