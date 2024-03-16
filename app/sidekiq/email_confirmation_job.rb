class EmailConfirmationJob
  include Sidekiq::Job

  def perform(user_id, room_id)
    user = User.find(user_id)
    room = user.rooms.where(id: room_id)[0]
    UserMailer.with(user: user, room: room.room).email_confirmation.deliver_later
  end
end
