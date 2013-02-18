Metacraft.Views.Tiles ||= {}

class Metacraft.Views.Tiles.EditView extends Backbone.View
  template : JST["backbone/templates/tiles/edit"]

  events :
    "submit #edit-tile" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (tile) =>
        @model = tile
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
