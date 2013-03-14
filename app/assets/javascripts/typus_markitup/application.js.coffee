#= require bootstrap-transition
#= require bootstrap-modal
#= require typus_markitup/jquery.markitup
#= require typus_markitup/textile

$(document).ready ->
  $('.markitup').markItUp(mySettings)







  # # Namespace alles below (other typus modules)


  # # Prompt
  # $('#myModal').modal('show');
  # $('[name="src"]').val('correct value');
  # $('[name="caption"]').val('correct value');

  # # get params from button
  # # set params on controls
  # if (img.substring(start, end).match(/^http:.+\.(jpg|png)$/))
  #   $('.preview img').attr('src', img.substring(start, end));
  # else
  #   $('.preview img').removeAttr('src');




  # # Listener
  # @options = {
  #   'allowedTypes': ['img', 'video', 'youtube', 'vimeo']
  # }
  # line = getLine(caret, string)
  # params = parameterize(line)
  # @type = params[1]

  # # write full params to the one applicable interface button and empty params to rest
  # return if @type in @options['allowedTypes']
  # $('.markitup button.'+@type).addClass('active')

  #   # getLine(caret, string)
  #   start = caret
  #   end = caret
  #   --start while start >= 0 and string[start-1] isnt "\n"
  #   ++end while end < string.length and string[end] isnt "\n"
  #   string.substring(start, end)


  #   # parameterize
  #   return line.match(/complex_r(e)g(e)x/)













  $('.markitup').bind('click', (e) ->
    caret = this.selectionStart
    string = $(this).val()
    start = caret
    end = caret
    --start while start >= 0 and string[start-1] isnt "\n"
    ++end while end < string.length and string[end] isnt "\n"
    line = string.substring(start, end)
    highlight = if line.match(/^img\([^\)]+\)\./) then '1px solid red' else 'none'
    $('a[title="Picture"]').css('border', highlight)
  )


  $('.markitup').on('keyup', (e) ->
    caret = this.selectionStart
    string = $(this).val()
    start = caret
    end = caret
    --start while start >= 0 and string[start-1] isnt "\n"
    ++end while end < string.length and string[end] isnt "\n"
    line = string.substring(start, end)
    highlight = if line.match(/^img\([^\)]+\)\./) then '1px solid red' else 'none'
    $('a[title="Picture"]').css('border', highlight)
  )