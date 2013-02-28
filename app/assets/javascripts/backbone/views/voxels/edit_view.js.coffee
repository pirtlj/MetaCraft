Metacraft.Views.Voxels ||= {}

class Metacraft.Views.Voxels.EditView extends Backbone.View
  template : JST["backbone/templates/voxels/edit"]

  events :
    "submit #edit-voxel" : "update"

  update : (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success : (voxel) =>
        @model = voxel
        window.location.hash = "/#{@model.id}"
    )

  render : ->
    $(@el).html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
