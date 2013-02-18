Metacraft.Views.Games ||= {}

class Metacraft.Views.Games.EditView extends Backbone.View
  template : JST["backbone/templates/games/edit"]

  events :
    "submit #edit-game" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (game) =>
        @model = game
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
