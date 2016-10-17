class ChangePlayerToUser < ActiveRecord::Migration[5.0]
  def change
  	change_table :players do |t|
  	  t.remove :race, :char_class, :score_method, :str, :con , :dex, :int, :wis, :cha, :level, :experience
  	  t.rename :name, :username
  	  t.string :email
  	  t.string :password_digest
  	end
  end
end
