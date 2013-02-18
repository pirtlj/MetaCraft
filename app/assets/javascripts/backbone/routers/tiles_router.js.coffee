class Metacraft.Routers.TilesRouter extends Backbone.Router
  initialize: (options) ->
    @tiles = new Metacraft.Collections.TilesCollection()
    @tiles.reset options.tiles

  routes:
    "new"      : "newTile"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newTile: ->
    @view = new Metacraft.Views.Tiles.NewView(collection: @tiles)
    $("#tiles").html(@view.render().el)

  index: ->
    @view = new Metacraft.Views.Tiles.IndexView(tiles: @tiles)
    $("#tiles").html(@view.render().el)

  show: (id) ->
    tile = @tiles.get(id)

    @view = new Metacraft.Views.Tiles.ShowView(model: tile)
    $("#tiles").html(@view.render().el)

  edit: (id) ->
    tile = @tiles.get(id)

    @view = new Metacraft.Views.Tiles.EditView(model: tile)
    $("#tiles").html(@view.render().el)
