class CreateCharLanguageTable < ActiveRecord::Migration[5.0]
  def change
    create_table :languages do |t|
    	t.references :characters
    	t.string :name
    end
  end
end
