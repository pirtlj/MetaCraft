class Metacraft.Models.Tile extends Backbone.Model
  paramRoot: 'tile'

  defaults:
    type: null
    x: null
    y: null

class Metacraft.Collections.TilesCollection extends Backbone.Collection
  model: Metacraft.Models.Tile
  url: '/tiles'
