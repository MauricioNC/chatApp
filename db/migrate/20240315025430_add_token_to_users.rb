class AddTokenToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :token, null: false, foreign_key: true
  end
end
