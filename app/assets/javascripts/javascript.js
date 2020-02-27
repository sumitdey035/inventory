$(document).ready(function() {
  $('.carousel').carousel({
    interval: 3000
  })

  $("#owl-demo").owlCarousel({
    navigation : false, // Show next and prev buttons
    slideSpeed : 600,
    paginationSpeed : 400,
    singleItem:true,
    autoPlay: 5000,
    pagination : false
  });

  $("#fact-slide").owlCarousel({
    navigation : false, // Show next and prev buttons
    slideSpeed : 600,
    paginationSpeed : 400,
    singleItem:true,
    autoPlay: 5000,
    pagination : true,
    autoHeight: false
  });

  $("#blog").owlCarousel({
    slideSpeed : 600,
    paginationSpeed : 400,
    navigation: true,
    items : 4,
    itemsDesktop : [1199,3],
    itemsDesktopSmall : [979,3]
  });

  $(".dropdown").hover(            
    function() {
      $('.dropdown-menu', this).stop( true, true ).fadeIn("fast");
      $(this).toggleClass('open');
      $('b', this).toggleClass("caret caret-up");                
    },
    function() {
      $('.dropdown-menu', this).stop( true, true ).fadeOut("fast");
      $(this).toggleClass('open');
      $('b', this).toggleClass("caret caret-up");                
    }
  );
});