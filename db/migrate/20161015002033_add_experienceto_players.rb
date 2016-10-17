class AddExperiencetoPlayers < ActiveRecord::Migration[5.0]
  def change
  	add_column :players, :experience, :integer
  end
end
