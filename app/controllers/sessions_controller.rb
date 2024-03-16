class SessionsController < ApplicationController
  def authorize
    token =  params[:token]
    room = params[:room]
    decoded = TokenizeService.new({ token: token }).decode_token

    if user_exist?(decoded[0]['email']).nil?
      redirect_to '/401.html'
      return
    end

    redirect_to show_room_path(room), notice: "You confirmed your email successfully"
  end

  def user_exist? email
    User.find_by_email(email)
  end
end
