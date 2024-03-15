class AddTokenToRooms < ActiveRecord::Migration[7.1]
  def change
    add_reference :rooms, :token, null: false, foreign_key: true
  end
end
