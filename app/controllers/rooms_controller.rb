class RoomsController < ApplicationController
  def show
    @room = Room.find_by_room(params[:room])
  end

  def new
    @room = Room.new
  end

  def create
    @user = User.find_or_create_by(user_params)
    unless @user.nil?
      session[:user_id] = @user.id
      @room = @user.rooms.build(room: SecureRandom.alphanumeric(15), uuid: SecureRandom.uuid)
    end
    respond_to do |format|
      if @room.save
        self.assing_room_to_user @room.id
        format.html { redirect_to show_room_path(room: @room.room) }
      else
        format.html { render :new, notice: 'An error has occured, try again', status: :unprocessable_entity }
      end
    end
  end

  def assing_room_to_user room_id
    room = Room.find(room_id)
    current_user.rooms << room
    EmailConfirmationJob.perform_async(current_user.id, room.id)
  end

  private

  def user_params
    params.require(:room).permit(:username, :email)
  end
end
