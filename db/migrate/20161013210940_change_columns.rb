class ChangeColumns < ActiveRecord::Migration[5.0]
  def change
  	remove_foreign_key :players, :race
  	remove_foreign_key :players, :class
  	add_column :players, :race, :string
  	add_column :players, :class, :string
  end
end
