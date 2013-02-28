Metacraft.Views.Voxels ||= {}

class Metacraft.Views.Voxels.IndexView extends Backbone.View
  template: JST["backbone/templates/voxels/index"]

  initialize: () ->
    @options.voxels.bind('reset', @addAll)

  addAll: () =>
    @options.voxels.each(@addOne)

  addOne: (voxel) =>
    view = new Metacraft.Views.Voxels.VoxelView({model : voxel})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(voxels: @options.voxels.toJSON() ))
    @addAll()

    return this
