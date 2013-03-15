#= require bootstrap-transition
#= require bootstrap-modal
#= require typus_markitup/jquery.markitup
#= require typus_markitup/textile
#= require_self
#= require typus_markitup/modules/listener

window.Typus = Typus or {}

Typus.MarkItUp =
  Views: {}

$(document).ready ->
  $('.markitup').markItUp(mySettings)
                .markItUpListener()



  # # Namespace everything below (other typus modules)


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