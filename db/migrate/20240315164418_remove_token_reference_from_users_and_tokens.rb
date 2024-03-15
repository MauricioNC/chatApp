class RemoveTokenReferenceFromUsersAndTokens < ActiveRecord::Migration[7.1]
  def change
    remove_reference :users, :token, index: true, foreign_key: true
    remove_reference :rooms, :token, index: true, foreign_key: true
  end
end
