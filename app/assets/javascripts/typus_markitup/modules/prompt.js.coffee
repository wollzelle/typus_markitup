



## Better structure in TODO



# All of the image module below is configurable (comes from external project)

# In textile.js
#   {name:'img', className: 'img', replaceWith: function(markItUp) {
#     $(window).imgPrompt(markItUp)
#     return false;
#   }},



#############IMAGE MODULE

# function imgPattern
#   img = {
#     "pattern": /^img\(([^\)]+)\)\. (https?:\/\/[\w\/\.\-\@]+)(?::(https?:\/\/[\S]+))?\s?(?:\((.*)\))?(.*)/

#     # TODO: Move these to _modal.html.erb
#     "form": {
#       "title": "Insert an Image",
#       "fields": [{
#         title: "Image Path",
#         id: "src",
#         placeholder: "http://example.wollzelle.com/image.jpg",
#         type: "text",
#         replaces: "\\3"
#       },{
#         title: "Caption",
#         id: "caption",
#         placeholder: "Caption to appear below the image",
#         type: "text",
#         replaces: "\\5"
#       }]
#     }
#   }
#   return img


# function imgSignature(fields, fieldMap)
#   img = 'img'
#   # loop through form field values, building img. signature
#   img = 'img(' + fields['classes'] + '). ' + fields['src'] + fields['link'] + ' (' + fields['alt'] + ') ' + fields['caption'];
#   return img;


# function imgPrompt(markItUp)
#   @selectionStart = $(markItUp.textarea).selectionStart
#   caret = @selectionStart
#   line = @getLine(@selectionStart, $(markItUp.textarea).val())
#   if (line.match(/http:\S+\.(jpg|png)/))
#     $('.preview img').attr('src', string.substring(start, end));
#   else
#     $('.preview img').removeAttr('src');

#   modal = buildModal(imgPattern["form"])
#   $(window).prompt(markItUp, modal, function(fields) {
#     img = imgSignature(fields);
#     $(markItUp.textarea).trigger('insertion', [{replaceWith: img}]);
#   })
#   # OR
#   # popup window or something else


# ###############GENERIC

# function buildModal(fields)
#   modal = '<div class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modal-label" aria-hidden="true">'
#   modal += "<form>"
#   modal += "<input>" # loop through all fields to build a form
#   return modal


# function prompt(markItUp, modalHtml, successCallback)

#   # TODO: replace the modal fields when a modal already exists in dom but a different one is needed
#   id = 'myModal';
#   if $('#'+id).length < 1
#     modal = $(modalHtml).insertBefore(markItUp.textarea);
#     modal.attr('id', id);
#   modal.modal();

#   modal.find('#link-submit').bind('click', function (event) {
#       event.stopPropagation();
#       event.preventDefault();



#       # TODO: Better matching of variables from form values
#       fields = {
#         src: $('[name="src"]').val(),
#         link: ($('[name="link"]').val()) ? ":" + $('[name="link"]').val() : "",
#         caption: $('[name="caption"]').val(),
#         alt: $('[name="alt"]').val() || $('<div>', { html: caption }).text(),
#         classes: '' #huge loop
#       }
#       successCallback(fields);

#       $('#myModal').modal('hide');
#   });

#   modal.find('#link-cancel').bind('click', function (event) {
#       event.preventDefault();
#       $('#myModal').modal('hide');
#   });












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





# After implementing here, remove the following code from textile.js

#var MarkupHelper = {
#     eventsAttached: false,

#     showDialog: function (markItUp) {
#         this.bindEvents(markItUp);
#         $('#myModal').modal('show');
#         $('[name="src"]').val('');
#         $('[name="caption"]').val('');

#         string = $(markItUp.textarea).val();
#         for (start = markItUp.caretPosition; start >= 0 && string[start-1] != " "; --start);
#         for (end = markItUp.caretPosition; end < string.length && string[end] != " " && string[end] != "\n"; ++end);
#         if (string.substring(start, end).match(/^http:.+\.(jpg|png)$/))
#           $('.preview img').attr('src', string.substring(start, end));
#         else
#           $('.preview img').removeAttr('src');
#     },

#     bindEvents: function (markItUp) {
#         if (this.eventsAttached) {
#             return;
#         }
#         this.eventsAttached = true;

#         $('#link-submit').bind('click', function (event) {
#             event.stopPropagation();
#             event.preventDefault();
#             var src = $('[name="src"]').val();
#             var link = ($('[name="link"]').val()) ? ":" + $('[name="link"]').val() : "";
#             var caption = $('[name="caption"]').val();
#             var alt = $('[name="alt"]').val() || $('<div>', { html: caption }).text();
#             var linkElement = 'img. ' + src + link + ' (' + alt + ') ' + caption;
#             $(markItUp.textarea).trigger('insertion', [{replaceWith: linkElement}]);
#             $('#myModal').modal('hide');
#         });

#         $('#link-cancel').bind('click', function (event) {
#             event.preventDefault();
#             $('#myModal').modal('hide');
#         });
#     }
# };




class Typus.MarkItUp.Prompt extends Backbone.View