class AddCharacteristicsToRace < ActiveRecord::Migration[5.0]
  def change
  	change_table :races do |t|
  		t.string :name
  		t.string :size
  		t.integer :speed
  		t.string :vision
  	end
  end
end
