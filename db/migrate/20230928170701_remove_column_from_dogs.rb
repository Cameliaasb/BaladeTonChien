class RemoveColumnFromDogs < ActiveRecord::Migration[7.0]
  def change
    remove_column :dogs, :shadow_level, :integer
    remove_column :dogs, :good_with_water, :integer
    remove_column :dogs, :good_with_chidren, :integer
    remove_column :dogs, :good_with_others_dogs, :integer
    remove_column :dogs, :good_with_strangers, :integer
    remove_column :dogs, :playfulness, :integer
  end
end
