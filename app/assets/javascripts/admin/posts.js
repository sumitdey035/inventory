$(document).ready(function(){
  $('.wysihtml5').each(function(i, elem) {
    $(elem).wysihtml5({
      toolbar: {
        'font-styles': true,
        'color': false,
        'emphasis': {
          'small': true
        },
        'blockquote': true,
        'lists': true,
        'html': false,
        'link': true,
        'image': true,
        'smallmodals': false
      }
    })
  });
})