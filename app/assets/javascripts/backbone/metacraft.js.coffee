#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

jQuery -> Metacraft.init()


window.Metacraft =
	Models: {}
	Collections: {}
	Routers: {}
	Views: {}

	init: -> 
		console.log "Metacraft.init" 
		window.router = new Metacraft.Routers.GamesRouter({})
		#Backbone.history.start()





