Metacraft.Views.Voxels ||= {}

class Metacraft.Views.Voxels.ShowView extends Backbone.View
  template: JST["backbone/templates/voxels/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
