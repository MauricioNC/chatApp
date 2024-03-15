class UserMailer < ApplicationMailer
  def email_confirmation
    @user = params[:user]
    @token = TokenizeService.new({ email: @user.email, username: @user.username }).generate_token
    Token.create(token: @token, tokenable: @user)
    mail(to: @user.email, subject: "Email confirmation" )
  end
end
