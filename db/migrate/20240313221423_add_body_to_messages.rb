class AddBodyToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :body, :string, null: false
  end
end
