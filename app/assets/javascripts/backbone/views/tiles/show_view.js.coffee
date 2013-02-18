Metacraft.Views.Tiles ||= {}

class Metacraft.Views.Tiles.ShowView extends Backbone.View
  template: JST["backbone/templates/tiles/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
