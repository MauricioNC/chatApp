require 'jwt'

class AuthorizeService
  SECRET_KEY = Rails.application.secrets.secret_key_base. to_s

  def initialize(payload = nil, token = nil)
    @payload = payload
    @token = token
  end

  def generate_token
    JWT.encode @payload, nil, 'none'
  end

  def validate_token
    JWT.decode @token, nil, false
  end
end
