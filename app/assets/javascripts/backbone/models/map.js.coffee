class Metacraft.Models.Map extends Backbone.Model
	paramRoot: 'map'
	
	parse: (response) ->
		response.voxels = new Metacraft.Collections.VoxelsCollection(response.voxels)
		return response

class Metacraft.Collections.MapsCollection extends Backbone.Collection
	model: Metacraft.Models.Map
	url: '/maps'
