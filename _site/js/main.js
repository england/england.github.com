$(document).ready(function(){
  var location = window.location.host;
  $('a').each(function(){
    if($(this).get(0).host != location) {
      $(this).attr('target','_blank');
    }
  });

  $(window).scroll(function(){
    if($(this).scrollTop() > 500){
      $('#return-button').fadeIn(100);
    } else {
      $('#return-button').fadeOut(50);
    }
  });

  /* Return viewport to the top */
  $('#return-button').click(function(){
    $('html, body').animate({'scrollTop': 0}, 200);
  });
});