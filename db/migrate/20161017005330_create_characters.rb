class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.references :player, foreign_key: :true
      t.references :race, foreign_key: true
      t.references :class, foreign_key: true
      t.string :height
      t.string :weight
      t.string :alignment
      t.string :diety
      t.integer :level
      t.integer :experience
      t.integer :score_method
      t.integer :str
      t.integer :con
      t.integer :dex
      t.integer :int
      t.integer :wis
      t.integer :cha

      t.timestamps
    end
  end
end
