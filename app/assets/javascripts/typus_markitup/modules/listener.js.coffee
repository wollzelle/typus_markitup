# Observes the caret position in the textarea and updates the toolbar buttons when a Textile signature (such as img.) is on the current line

class Typus.MarkItUp.Listener extends Backbone.View

  events:
    'keyup': 'updateToolbar'
    'click': 'updateToolbar'

  defaults:
    signaturePatterns:
      img: /^img\(([^\)]+)\)\. (https?:\/\/[\w\/\.\-\@]+)(?::(https?:\/\/[\S]+))?\s?(?:\((.*)\))?(.*)/
      # video:
      # youtube:
      # vimeo:

  initialize: (options) ->
    options = _.extend(@defaults, options)
    @el = options.el
    @$el = $(options.el)
    @signaturePatterns = options.signaturePatterns

  getLine: (caret, string) ->
    start = caret
    end = caret
    --start while start >= 0 and string[start-1] isnt "\n"
    ++end while end < string.length and string[end] isnt "\n"
    string.substring(start, end)

  updateToolbar: (e) ->
    caret = @selectionStart
    line = @getLine(@el.selectionStart, @$el.val())
    for sig, pattern of @signaturePatterns
      button = $(".markItUpButton:has(a[title='#{sig}'])")
      match = line.match(pattern)
      console.log match
      if match
        [all, classes, image, link, alt, caption] = match
        @activateToolbarButton(button, [image, caption, alt, link, classes])
      else
        @deactivateToolbarButton(button)

  activateToolbarButton: (button, params) ->
    button.addClass('active')
    button.data('params', params)

  deactivateToolbarButton: (button) ->
    button.removeClass('active')
    button.data('params', null)

##
# Plugin definition
#

$.fn.markItUpListener = (options) ->
  options ||= {}
  markItUpListener = @data('markItUpListener')
  if (!markItUpListener)
    @each (idx, el) ->
      options.el = el
      $(el).data('markItUpListener', new Typus.MarkItUp.Listener(options))

