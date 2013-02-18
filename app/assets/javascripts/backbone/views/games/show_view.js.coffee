Metacraft.Views.Games ||= {}

class Metacraft.Views.Games.ShowView extends Backbone.View
  template: JST["backbone/templates/games/show"]

  render: ->
    $(@el).html(@template(@model.toJSON() ))
    return this
