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

Metacraft.addInitializer (options) ->
	console.log "Metacraft.init"
	@router = new Metacraft.Routers.GamesRouter({})
	
	@socket = new Metacraft.Dispatchers.Socket('localhost:3000/websocket')
	
	@socket.on_open = (data) =>
		console.log('Connection has been established: ' + data)
		console.log "test event start"
		testSuccess = (response) -> 
			console.log("Response: " + response.message)
		testFailsure = (response) ->
			console.log("Response: " + response.message)
		@socket.trigger('test', {message: "this is from client"}, testSuccess, testFailsure)






