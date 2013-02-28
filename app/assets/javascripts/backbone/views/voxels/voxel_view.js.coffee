Metacraft.Views.Voxels ||= {}

class Metacraft.Views.Voxels.VoxelView extends Backbone.View
  template: JST["backbone/templates/voxels/voxel"]

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
