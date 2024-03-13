class Message < ApplicationRecord
  belongs_to :from_user_id
  belongs_to :to_user_id
end
