class User < ApplicationRecord
  has_many :tokens, as: :tokenable
  has_many :user_rooms
  has_many :rooms, through: :user_rooms
  has_many :sender_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :receiver_messages, class_name: 'Message', foreign_key: 'receiver_id'
end
