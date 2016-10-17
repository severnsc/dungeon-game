class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.references :race, foreign_key: true
      t.references :class, foreign_key: true
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
