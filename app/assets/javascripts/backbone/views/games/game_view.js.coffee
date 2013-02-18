Metacraft.Views.Games ||= {}

class Metacraft.Views.Games.GameView extends Backbone.View
  template: JST["backbone/templates/games/game"]

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
