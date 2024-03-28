class MessagesController < ApplicationController
  before_action :set_room, only: [:create]
  before_action :set_receiver, only: [:create]

  def create
    @message = current_user.sender_messages.build(message_params)
    if @message.save
      ActionCable.server.broadcast(
        "room_#{@room.room}",
        {
          body: @message.body
        }
      )
    end
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_receiver
    @receiver = User.last
  end

  def message_params
    params.require(:message)[:receiver_id] = @receiver.id
    params.require(:message)[:room_id] = @room.id
    params.require(:message).permit(:body, :receiver_id, :room_id)
  end
end
