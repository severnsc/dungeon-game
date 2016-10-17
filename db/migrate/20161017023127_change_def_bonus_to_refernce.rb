class ChangeDefBonusToRefernce < ActiveRecord::Migration[5.0]
  def change
  	change_table :char_classes do |t|
  		t.remove :def_bonus_name, :def_bonus_value
  	end
  end
end
