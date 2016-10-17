class ChangeForeignColumns2 < ActiveRecord::Migration[5.0]
  def change
  	remove_foreign_key :players, name: :race_id
  	remove_foreign_key :players, name: :class_id
  end
end
