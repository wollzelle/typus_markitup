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
		{name:'Heading 3', key:'3', openWith:'h3(!(([![Class]!]))!). ', placeHolder:'Your title here...' },
		{name:'Heading 4', key:'4', openWith:'h4(!(([![Class]!]))!). ', placeHolder:'Your title here...' },
		{name:'Heading 5', key:'5', openWith:'h5(!(([![Class]!]))!). ', placeHolder:'Your title here...' },
		{name:'Heading 6', key:'6', openWith:'h6(!(([![Class]!]))!). ', placeHolder:'Your title here...' },
		{name:'Paragraph', key:'P', openWith:'p(!(([![Class]!]))!). '},
		{separator:'---------------' },
		{name:'Bold', key:'B', closeWith:'*', openWith:'*'},
		{name:'Italic', key:'I', closeWith:'_', openWith:'_'},
		{name:'Stroke through', key:'S', closeWith:'-', openWith:'-'},
		{separator:'---------------' },
		{name:'Bulleted list', openWith:'(!(* |!|*)!)'},
		{name:'Numeric list', openWith:'(!(# |!|#)!)'},
		{separator:'---------------' },
		{name:'Picture', replaceWith: function(markItUp) {
			MarkupHelper.showDialog(markItUp);
			return false;
		}},
		{name:'Link', openWith:'"', closeWith:'([![Title]!])":[![Link:!:http://]!]', placeHolder:'Your text to link here...' },
		{separator:'---------------' },
		{name:'Quotes', openWith:'bq(!(([![Class]!]))!). '},
		{name:'Code', openWith:'@', closeWith:'@'},
		{separator:'---------------' },
		{name:'Preview', call:'preview', className:'preview'}
	]
}

var MarkupHelper = {
    eventsAttached: false,

    showDialog: function (markItUp) {
        this.bindEvents(markItUp);
        $('#myModal').modal('show');
        $('[name="src"]').val('');
        $('[name="caption"]').val('');

				string = $(markItUp.textarea).val();
				for (start = markItUp.caretPosition; start >= 0 && string[start-1] != " "; --start);
				for (end = markItUp.caretPosition; end < string.length && string[end] != " "; ++end);
				if (string.substring(start, end).match(/^http:.+\.(jpg|png)$/))
          $('.preview img').attr('src', string.substring(start, end));
        else
          $('.preview img').removeAttr('src');
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
            var alt = $('[name="alt"]').val() || $('<div>', { html: caption }).text();
            var linkElement = 'img. ' + src + link + ' (' + alt + ') ' + caption;
            $(markItUp.textarea).trigger('insertion', [{replaceWith: linkElement}]);
            $('#myModal').modal('hide');
        });

        $('#link-cancel').bind('click', function (event) {
            event.preventDefault();
            $('#myModal').modal('hide');
        });
    }
};