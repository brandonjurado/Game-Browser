class CreateLikes < ActiveRecord::Migration[5.0]
  def change
    create_table :likes do |t|
      t.string :game_title, :null => false
      t.datetime :liked_at, :null => false
      t.string :ip_address, :null => false
      t.integer :game_id,   :null => false
      t.timestamps
    end
  end
end
