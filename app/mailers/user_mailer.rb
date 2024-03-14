class UserMailer < ApplicationMailer
  def email_confirmation
    @user = params[:user]
    @token = AuthorizeService.new({ email: @user.email, username: @user.username }).generate_token
    mail(to: @user.email, subject: "Email confirmation" )
  end
end
