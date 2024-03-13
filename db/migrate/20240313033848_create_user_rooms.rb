class CreateUserRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :user_rooms do |t|
      t.references :users, null: false, foreign_key: true
      t.references :rooms, null: false, foreign_key: true

      t.timestamps
    end
  end
end
