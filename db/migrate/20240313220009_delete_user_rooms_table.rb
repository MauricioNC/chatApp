class DeleteUserRoomsTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :user_rooms
  end
end
