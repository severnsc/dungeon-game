class AddLevelToPlayers < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :level, :integer
  end
end
