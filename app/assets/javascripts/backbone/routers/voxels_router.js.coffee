class Metacraft.Routers.VoxelsRouter extends Backbone.Router
  initialize: (options) ->
    @voxels = new Metacraft.Collections.VoxelsCollection()
    @voxels.reset options.voxels

  routes:
    "new"      : "newVoxel"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newVoxel: ->
    @view = new Metacraft.Views.Voxels.NewView(collection: @voxels)
    $("#voxels").html(@view.render().el)

  index: ->
    @view = new Metacraft.Views.Voxels.IndexView(voxels: @voxels)
    $("#voxels").html(@view.render().el)

  show: (id) ->
    voxel = @voxels.get(id)

    @view = new Metacraft.Views.Voxels.ShowView(model: voxel)
    $("#voxels").html(@view.render().el)

  edit: (id) ->
    voxel = @voxels.get(id)

    @view = new Metacraft.Views.Voxels.EditView(model: voxel)
    $("#voxels").html(@view.render().el)
