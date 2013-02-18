Metacraft.Views.Tiles ||= {}

class Metacraft.Views.Tiles.IndexView extends Backbone.View
  template: JST["backbone/templates/tiles/index"]

  initialize: () ->
    @options.tiles.bind('reset', @addAll)

  addAll: () =>
    @options.tiles.each(@addOne)

  addOne: (tile) =>
    view = new Metacraft.Views.Tiles.TileView({model : tile})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(tiles: @options.tiles.toJSON() ))
    @addAll()

    return this
