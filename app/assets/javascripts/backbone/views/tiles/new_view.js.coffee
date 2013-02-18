Metacraft.Views.Tiles ||= {}

class Metacraft.Views.Tiles.NewView extends Backbone.View
  template: JST["backbone/templates/tiles/new"]

  events:
    "submit #new-tile": "save"

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
      success: (tile) =>
        @model = tile
        window.location.hash = "/#{@model.id}"

      error: (tile, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
