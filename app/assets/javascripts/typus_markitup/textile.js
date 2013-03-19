// -------------------------------------------------------------------
// markItUp!
// -------------------------------------------------------------------
// Copyright (C) 2008 Jay Salvat
// http://markitup.jaysalvat.com/
// -------------------------------------------------------------------
// Textile tags example
// http://en.wikipedia.org/wiki/Textile_(markup_language)
// http://www.textism.com/
// -------------------------------------------------------------------
// Feel free to add more tags
// -------------------------------------------------------------------

mySettings = {
	previewParserPath:	'', // path to your Textile parser
	onShiftEnter:		{keepDefault:false, replaceWith:'\n\n'},
	markupSet: [
		{name:'Heading 1', key:'1', openWith:'h1(!(([![Class]!]))!). ', placeHolder:'Your title here...' },
		{name:'Heading 2', key:'2', openWith:'h2(!(([![Class]!]))!). ', placeHolder:'Your title here...' },
		{separator:'---------------' },
		{name:'Bold', key:'B', closeWith:'*', openWith:'*'},
		{name:'Italic', key:'I', closeWith:'_', openWith:'_'},
		{separator:'---------------' },
		{name:'Bulleted list', openWith:'(!(* |!|*)!)'},
		{name:'Numeric list', openWith:'(!(# |!|#)!)'},
		{separator:'---------------' },
		{name:'img', className: 'img', replaceWith: function(markItUp) {
			MarkupHelper.showDialog(markItUp);
			return false;
		}},
		{name:'Link', openWith:'"', closeWith:'([![Title]!])":[![Link:!:http://]!]', placeHolder:'Your text to link here...' },
    {separator:'---------------' },
    {name:'Quotes', openWith:'bq(!(([![Class]!]))!). '},
    {name:'Code', openWith:'@', closeWith:'@'}
	]
};

var MarkupHelper = {
    eventsAttached: false,

    showDialog: function (markItUp) {
        this.bindEvents(markItUp);
        var modal   = $('#myModal'),
            src     = modal.find('[name="src"]').val(''),
            caption = modal.find('[name="caption"]').val(''),
            alt     = modal.find('[name="alt"]').val(''),
            link    = modal.find('[name="link"]').val(''),
            classes = modal.find('[name*="class_"]'),
            preview = modal.find('.preview img');

        modal.modal('show');

				string = $(markItUp.textarea).val();
				for (start = markItUp.caretPosition; start >= 0 && string[start-1] != "\n"; --start);
				for (end = markItUp.caretPosition; end < string.length && string[end] != "\n"; ++end);
        line = string.substring(start, end);

        markItUp.textarea.setSelectionRange(start, end);

        match = line.match(/^(inline)?img\(([^\)]*)\)\. (https?:\/\/[\w\/\.\-\@]+)(?::(https?:\/\/[\S]+))?\s?(?:\((.*)\))?(.*)/);
        if (match) {
          matches = {};
          matches['inline'] = match[1];
          matches['classes'] = match[2];
          matches['image'] = match[3];
          matches['link'] = match[4];
          matches['alt'] = match[5];
          matches['caption'] = match[6];
          preview.attr('src', matches['image']);
          src.val(matches['image']);
          caption.val(matches['caption']);
          alt.val(matches['alt']);
          link.val(matches['link']);
          if (matches['inline']) {
            matches['classes'] = matches['classes'].replace(/(left|right)/, "inline $1");
          }
          classes.each(function() {
            if (matches['classes'].match($(this).val())) {
              $(this).attr('checked', 'checked');
            } else {
              if (!$(this).data("checked-default")) {
                $(this).removeAttr('checked');
              }
            }
          });
        } else {
          preview.removeAttr('src');
        }

    },

    bindEvents: function (markItUp) {
        if (this.eventsAttached) {
            return;
        }
        this.eventsAttached = true;

        $('#link-submit').bind('click', function (event) {
            event.stopPropagation();
            event.preventDefault();
            var src = $('[name="src"]').val();
            var link = ($('[name="link"]').val()) ? ":" + $('[name="link"]').val() : "";
            var caption = $('[name="caption"]').val();
            var alt = $('[name="alt"]').val() || caption.replace(/"([^"]+)":\S+/g, "$1");
            var classes = '';
            if (caption !== "") {
              caption = " " + caption;
            }
            if (alt !== "") {
              alt = " (" + alt + ")";
            }
            $('#myModal [name*="class_"]').each(function(){
              if ($(this).is(":checked") && $(this).val() !== '') {
                classes += $(this).val() + " ";
              }
            });
            classes = classes.trim();

            var linkElement = 'img(' + classes + '). ' + src + link + alt + caption;
            $(markItUp.textarea).trigger('insertion', [{replaceWith: linkElement}]);
            $('#myModal').modal('hide');
        });

        $('#link-cancel').bind('click', function (event) {
            event.preventDefault();
            $('#myModal').modal('hide');
        });
    }
};