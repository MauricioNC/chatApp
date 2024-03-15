class AddTokenableReferenceToTokens < ActiveRecord::Migration[7.1]
  def change
    add_reference :tokens, :tokenable, polymorphic: true, null: false
  end
end
