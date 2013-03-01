class Metacraft.Models.Game extends Backbone.Model
	paramRoot: 'game'
	urlRoot : '/games'
	defaults: {}

	parse: (response) ->
		maps = new Metacraft.Collections.MapsCollection()
		maps.reset(response.maps, {parse: true})
		response.maps = maps
		return response


class Metacraft.Collections.GamesCollection extends Backbone.Collection
	model: Metacraft.Models.Game
	url: '/games'
