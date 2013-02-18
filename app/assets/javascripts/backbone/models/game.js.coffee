class Metacraft.Models.Game extends Backbone.Model
	paramRoot: 'game'

	defaults: {}

class Metacraft.Collections.GamesCollection extends Backbone.Collection
	model: Metacraft.Models.Game
	url: '/games'
