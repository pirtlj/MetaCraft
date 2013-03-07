class Metacraft.Models.Voxel extends Backbone.Model
  paramRoot: 'voxel'

  defaults:
    map_id: null
    type: null
    x: null
    y: null
    z: null

class Metacraft.Collections.VoxelsCollection extends Backbone.Collection
  model: Metacraft.Models.Voxel
	url:     '/voxels'	

