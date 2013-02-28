class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.integer :game_id
      t.string :type

      t.timestamps
    end
  end
end
