#= require underscore
#= require backbone
#= require jquery.markitup
#= require_self
#= require ./listener

window.Typus = Typus or {}
Typus.MarkItUp = {}

settings =
  previewParserPath: ''
  onShiftEnter:   {keepDefault:false, replaceWith:'\n\n'}
  markupSet: [
    {name:'H1', className: 'btn', key:'1', openWith:'h1(!(([![Class]!]))!). ', placeHolder:'Your title here...' }
    {name:'H2', className: 'btn', key:'2', openWith:'h2(!(([![Class]!]))!). ', placeHolder:'Your title here...' }
    {name:'B', className: 'btn', key:'B', closeWith:'*', openWith:'*'}
    {name:'I', className: 'btn', key:'I', closeWith:'_', openWith:'_'}
    {name:'', className: 'btn', openWith:'(!(* |!|*)!)'}
    {name:'', className: 'btn', openWith:'(!(# |!|#)!)'}
    {name:'', className: 'btn', openWith:'img(classes). ', placeHolder: 'url'}
    {name:'', className: 'btn', openWith:'"', closeWith:'([![Title]!])":[![Link:!:http://]!]', placeHolder:'Your text to link here...' }
    {name:'', className: 'btn', openWith:'bq(!(([![Class]!]))!). '}
    {name:'', className: 'btn', openWith:'@', closeWith:'@'}
  ]

$(document).ready ->
  $('.markitup').each -> $(this).markItUp(settings).markItUpListener()