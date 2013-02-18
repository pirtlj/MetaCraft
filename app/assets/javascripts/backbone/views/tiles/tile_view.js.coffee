Metacraft.Views.Tiles ||= {}

class Metacraft.Views.Tiles.TileView extends Backbone.View
  template: JST["backbone/templates/tiles/tile"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
