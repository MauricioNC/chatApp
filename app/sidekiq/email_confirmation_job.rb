class EmailConfirmationJob
  include Sidekiq::Job

  def perform(user_id)
    user = User.find(user_id)
    UserMailer.with(user: user).email_confirmation.deliver_later
  end
end
