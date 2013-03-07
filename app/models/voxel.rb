class Voxel < ActiveRecord::Base
  attr_accessible :map_id, :type, :x, :y, :z
  belongs_to :map
  
  
  #TODO roll this into a module syncable -pirtlj
  
  after_create do |obj|
    WebsocketRails[obj.collection_channel_name].trigger 'create', obj
  end
  
  after_create do |obj|
    WebsocketRails[obj.collection_channel_name].trigger 'update', obj
  end
  
  after_destroy do |obj|
    WebsocketRails[obj.collection_channel_name].trigger 'destroy', obj
  end
  
  #TODO need to make chanel names more cononical -pirtlj
  def collection_channel_name
    "map#{map_id}.voxels"
  end
  
end
