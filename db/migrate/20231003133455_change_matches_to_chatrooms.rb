class ChangeMatchesToChatrooms < ActiveRecord::Migration[7.0]
  def change
    rename_table :matches, :chatrooms
  end
end
