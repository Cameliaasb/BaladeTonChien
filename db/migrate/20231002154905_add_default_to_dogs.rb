class AddDefaultToDogs < ActiveRecord::Migration[7.0]
  def change
    change_column :dogs, :neutered, :boolean, default: false
    change_column :dogs, :neutered_males, :boolean, default: false
    change_column :dogs, :neutered_females, :boolean, default: false
    change_column :dogs, :unneutered_males, :boolean, default: false
    change_column :dogs, :unneutered_females, :boolean, default: false
    change_column :dogs, :small_dogs, :boolean, default: false
    change_column :dogs, :big_dogs, :boolean, default: false
  end
end
