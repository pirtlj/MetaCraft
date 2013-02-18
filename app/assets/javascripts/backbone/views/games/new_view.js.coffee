Metacraft.Views.Games ||= {}

class Metacraft.Views.Games.NewView extends Backbone.View
  template: JST["backbone/templates/games/new"]

  events:
    "submit #new-game": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (game) =>
        @model = game
        window.location.hash = "/#{@model.id}"

      error: (game, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
