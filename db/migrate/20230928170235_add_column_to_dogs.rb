class AddColumnToDogs < ActiveRecord::Migration[7.0]
  def change
    add_column :dogs, :males, :boolean
    add_column :dogs, :females, :boolean
    add_column :dogs, :unneutered_males, :boolean
    add_column :dogs, :unneutered_females, :boolean
    add_column :dogs, :small_dogs, :boolean
    add_column :dogs, :big_dogs, :boolean
  end
end
