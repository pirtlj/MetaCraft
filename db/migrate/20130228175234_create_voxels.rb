class CreateVoxels < ActiveRecord::Migration
  def change
    create_table :voxels do |t|
      t.integer :map_id
      t.string :type
      t.integer :x
      t.integer :y
      t.integer :z

      t.timestamps
    end
  end
end
