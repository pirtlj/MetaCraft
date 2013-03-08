class Metacraft.Models.Map extends Backbone.Model
	paramRoot: 'map'
	
	initialize: (options) ->
		console.log "Metacraft.Models.Map.initialize"
		
		@voxelsChannel = Metacraft.socket.subscribe(@voxelsChannel())
		
		@voxelsChannel.bind('create', (model) =>
			console.log('create event received: ' + model)
			@get("voxels").add(model)
			Metacraft.vent.trigger("game:change")
		)
		
		@voxelsChannel.bind('update', (data) =>
			console.log('update event received: ' + data)
			model = @get("voxels").get(data.id)
			model.set(data)
			model.trigger("sync:socket") 
		)
		
		@voxelsChannel.bind('destroy', (model) =>
			console.log('destroy event received: ' + model)
			@get("voxels").remove(model.id)
			Metacraft.vent.trigger("game:change")
		)
		
	
	parse: (response) ->
		response.voxels = new Metacraft.Collections.VoxelsCollection(response.voxels)
		return response
	
	voxelsChannel: ->
		"map" + @id + ".voxels"

class Metacraft.Collections.MapsCollection extends Backbone.Collection
	model: Metacraft.Models.Map
	url: '/maps'
	
	initialize: (options) ->
		console.log "Metacraft.Models.MapsCollection.initialize"
		
	
	
	