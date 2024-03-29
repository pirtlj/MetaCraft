#= require_self
#= require ./socket
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

jQuery -> Metacraft.start()

window.Metacraft = new Backbone.Marionette.Application()

Metacraft.Models = {}
Metacraft.Collections = {}
Metacraft.Routers = {}
Metacraft.Views = {}
Metacraft.Dispatchers = {}

Metacraft.addRegions({
	mainRegion: "#main-container"
})	

Metacraft.addInitializer (options) ->
	loc = window.location	
	
	@router = new Metacraft.Routers.GamesRouter({})
	
	@socket = new Metacraft.Dispatchers.Socket(loc.host + "/websocket")
	
	@socket.on_open = (data) =>
		console.log('Connection has been established: ' + data)
		testSuccess = (response) => 
			console.log("Socket Test Success: " + response.message)
		testFailure = (response) ->
			console.log("Socket Test Failure: " + response.message)
		console.log "Socket Test"	
		@socket.trigger('test', {message: "this is from client"}, testSuccess, testFailure)
	
Metacraft.addInitializer (options) ->
	@game = new Metacraft.Models.Game({id: 1})
	@game.fetch()
	@gameView = new Metacraft.Views.Games.ShowView({model: @game})
	@mainRegion.show(@gameView)
	