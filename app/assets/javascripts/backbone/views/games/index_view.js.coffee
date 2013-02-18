Metacraft.Views.Games ||= {}

class Metacraft.Views.Games.IndexView extends Backbone.View
  template: JST["backbone/templates/games/index"]

  initialize: () ->
    @options.games.bind('reset', @addAll)

  addAll: () =>
    @options.games.each(@addOne)

  addOne: (game) =>
    view = new Metacraft.Views.Games.GameView({model : game})
    @$("tbody").append(view.render().el)

  render: =>
    $(@el).html(@template(games: @options.games.toJSON() ))
    @addAll()

    return this
