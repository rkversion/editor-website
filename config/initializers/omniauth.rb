CA_BUNDLES = ["/etc/ssl/certs/ca-certificates.crt", "/etc/pki/tls/cert.pem"].freeze

OmniAuth.config.logger = Rails.logger
OmniAuth.config.failure_raise_out_environments = []
