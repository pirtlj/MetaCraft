class Metacraft.Models.Game extends Backbone.Model
	paramRoot: 'game'
	urlRoot : '/games'
	defaults: {}
	
	initialize: (options) ->
		console.log "Metacraft.Models.Game.initialize"
		
	parse: (response) ->
		maps = new Metacraft.Collections.MapsCollection()
		maps.reset(response.maps, {parse: true})
		response.maps = maps
		return response


class Metacraft.Collections.GamesCollection extends Backbone.Collection
	model: Metacraft.Models.Game
	url: '/games'

