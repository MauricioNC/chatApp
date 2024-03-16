require 'jwt'

class TokenizeService
  SECRET_KEY = Rails.application.secrets.secret_key_base. to_s

  def initialize(params = {})
    @payload = params[:payload]
    @token = params[:token]
  end

  def generate_token
    JWT.encode @payload, SECRET_KEY, 'HS256'
  end

  def decode_token
    JWT.decode @token, SECRET_KEY, true, { algorithm: 'HS256' }
  rescue JWT::EncodeError
    redirect_to root_path, notice: 'Invalid token', status: :unauthorized
  end
end
