
class Invitation < ApplicationRecord
  belongs_to :user
  has_many :tokens, as: :tokenable
end
