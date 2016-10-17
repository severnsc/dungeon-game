class CreateCharClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :char_classes do |t|
    	t.string :name
    	t.integer :hit_points_per_level
    	t.string :def_bonus_name
    	t.integer :def_bonus_value
      t.timestamps
    end
  end
end
