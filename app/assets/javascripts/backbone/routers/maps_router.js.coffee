class Metacraft.Routers.MapsRouter extends Backbone.Router
  initialize: (options) ->
    @maps = new Metacraft.Collections.MapsCollection()
    @maps.reset options.maps

  routes:
    "new"      : "newMap"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newMap: ->
    @view = new Metacraft.Views.Maps.NewView(collection: @maps)
    $("#maps").html(@view.render().el)

  index: ->
    @view = new Metacraft.Views.Maps.IndexView(maps: @maps)
    $("#maps").html(@view.render().el)

  show: (id) ->
    map = @maps.get(id)

    @view = new Metacraft.Views.Maps.ShowView(model: map)
    $("#maps").html(@view.render().el)

  edit: (id) ->
    map = @maps.get(id)

    @view = new Metacraft.Views.Maps.EditView(model: map)
    $("#maps").html(@view.render().el)
