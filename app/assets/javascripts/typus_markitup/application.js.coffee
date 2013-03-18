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
  $('.markitup').each ->
    $(this).markItUp(mySettings)
           .markItUpListener()