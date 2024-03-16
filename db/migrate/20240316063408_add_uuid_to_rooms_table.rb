class AddUuidToRoomsTable < ActiveRecord::Migration[7.1]
  def change
    add_column :rooms, :uuid, :string, null: false
  end
end
