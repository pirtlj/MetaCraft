Metacraft.Views.Maps ||= {}

class Metacraft.Views.Maps.MapView extends Backbone.View
  template: JST["backbone/templates/maps/map"]

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
