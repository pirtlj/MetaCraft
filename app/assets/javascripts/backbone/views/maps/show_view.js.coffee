Metacraft.Views.Maps ||= {}

class Metacraft.Views.Maps.ShowView extends Backbone.View
  template: JST["backbone/templates/maps/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
