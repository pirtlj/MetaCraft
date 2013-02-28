Metacraft.Views.Voxels ||= {}

class Metacraft.Views.Voxels.NewView extends Backbone.View
  template: JST["backbone/templates/voxels/new"]

  events:
    "submit #new-voxel": "save"

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
      success: (voxel) =>
        @model = voxel
        window.location.hash = "/#{@model.id}"

      error: (voxel, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
