class Voxel < ActiveRecord::Base
  attr_accessible :map_id, :type, :x, :y, :z
  belongs_to :map
  
   
end
