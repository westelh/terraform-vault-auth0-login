resource "vault_jwt_auth_backend" "oidc" {
  description        = "OIDC Backend Connected to Auth0"
  path               = var.path
  type               = "oidc"
  oidc_discovery_url = var.discobery_url
  oidc_client_id     = var.client_id
  oidc_client_secret = var.client_secret
  default_role       = "default"
}

resource "vault_jwt_auth_backend_role" "default" {
  allowed_redirect_uris = [
    "http://localhost:8250/oidc/callback",
    "${var.vault_host}/ui/vault/auth/${vault_jwt_auth_backend.oidc.path}/oidc/callback"
  ]
  backend                      = vault_jwt_auth_backend.oidc.path
  bound_audiences              = [vault_jwt_auth_backend.oidc.oidc_client_id]
  bound_claims                 = null
  bound_claims_type            = "string"
  bound_subject                = null
  claim_mappings               = null
  user_claim                   = "sub"
  groups_claim                 = "sub"
  clock_skew_leeway            = 0
  disable_bound_claims_parsing = null
  expiration_leeway            = 0
  max_age                      = 0
  not_before_leeway            = 0
  oidc_scopes                  = []
  role_name                    = "default"
  role_type                    = "oidc"
  token_bound_cidrs            = []
  token_explicit_max_ttl       = 0
  token_max_ttl                = 0
  token_num_uses               = 0
  token_period                 = 0
  token_policies               = var.policies
  token_type                   = "default"
}

