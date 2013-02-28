class Metacraft.Routers.GamesRouter extends Backbone.Router
	initialize: (options) ->
		console.log "GamesRouter.initialize"
		
		routes:
			"new"      : "newGame"
			"index"    : "index"
			":id/edit" : "edit"
			":id"      : "show"
			".*"        : "index"
			
	newGame: ->
		@view = new Metacraft.Views.Games.NewView(collection: @games)
		$("#games").html(@view.render().el)

	index: ->
		@view = new Metacraft.Views.Games.IndexView(games: @games)
		$("#games").html(@view.render().el)

	show: (id) ->
		game = @games.get(id) 

		@view = new Metacraft.Views.Games.ShowView(model: game)
		$("#games").html(@view.render().el)

	edit: (id) ->
		game = @games.get(id)

		@view = new Metacraft.Views.Games.EditView(model: game)
		$("#games").html(@view.render().el)


