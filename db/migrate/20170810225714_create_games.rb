class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string  :name
      t.text    :description
      t.integer :year
      t.string  :manufacturer
      t.boolean :active

      
      t.timestamps
    end
    add_attachment :games, :image
  end
end
