variable "path" {
  type = string
}

variable "domain" {
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
