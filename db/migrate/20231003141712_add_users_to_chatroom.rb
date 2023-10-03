class AddUsersToChatroom < ActiveRecord::Migration[7.0]
  def change
    add_reference :chatrooms, :first_user, foreign_key: { to_table: :users }
    add_reference :chatrooms, :second_user, foreign_key: { to_table: :users }
  end
end
