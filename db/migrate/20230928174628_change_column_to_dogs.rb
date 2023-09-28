class ChangeColumnToDogs < ActiveRecord::Migration[7.0]
  def change
    rename_column :dogs, :males, :neutered_males
    rename_column :dogs, :females, :neutered_females
  end
end
