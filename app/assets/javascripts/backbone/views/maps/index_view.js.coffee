Metacraft.Views.Maps ||= {}

class Metacraft.Views.Maps.IndexView extends Backbone.View
  template: JST["backbone/templates/maps/index"]

  initialize: () ->
    @options.maps.bind('reset', @addAll)

  addAll: () =>
    @options.maps.each(@addOne)

  addOne: (map) =>
    view = new Metacraft.Views.Maps.MapView({model : map})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(maps: @options.maps.toJSON() ))
    @addAll()

    return this
