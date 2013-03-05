class Voxel < ActiveRecord::Base
  attr_accessible :map_id, :type, :x, :y, :z
  belongs_to :map
  
  after_save do |obj|
    WebsocketRails[:game].trigger 'update', "VOXEL SAVED"
  end
  
end
