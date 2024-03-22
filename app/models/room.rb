class Room < ApplicationRecord
  has_many :tokens, as: :tokenable
  has_many :user_rooms
  has_many :users, through: :user_rooms
  has_many :messages
end
