class RemoveMatchesFromMessages < ActiveRecord::Migration[7.0]
  def change
    remove_column :messages, :match_id, :bigint
  end
end
