class UpdateForeignKeyInMessages < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :messages, column: :match_id
    add_reference :messages, :chatroom, foreign_key: true
  end
end
