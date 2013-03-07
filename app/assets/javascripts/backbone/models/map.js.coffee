class Metacraft.Models.Map extends Backbone.Model
	paramRoot: 'map'
	
	initialize: (options) ->
		console.log "Metacraft.Models.Map.initialize"
		
		@voxelsChannel = Metacraft.socket.subscribe(@voxelsChannel())
		
		@voxelsChannel.bind('create', (model) ->
			console.log('create event received: ' + data)
			@add(model)
		)
		
		@voxelsChannel.bind('update', (model) ->
			console.log('update event received: ' + data)
			@get(model.id).set(model)
		)
		
		@voxelsChannel.bind('destroy', (model) ->
			console.log('destroy event received: ' + data)
			@remove(model.id)
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
		
	
	
	