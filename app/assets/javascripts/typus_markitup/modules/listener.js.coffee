class Typus.Markitup.Listener extends Backbone.View

  events:
    'keyup textarea': 'update'
    'click textarea': 'update'

  update: (e) ->
    @