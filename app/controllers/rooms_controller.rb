class RoomsController < ApplicationController
  def new
    @room = Room.new
  end

  def create
    @user = User.find_by_email(params[:room][:email])
    if @user.nil?
      render :new
    else
      EmailConfirmationJob.perform_async(@user.id)
      respond_to do |format|
        format.html {}
        format.turbo_stream
      end
    end
  end
end
