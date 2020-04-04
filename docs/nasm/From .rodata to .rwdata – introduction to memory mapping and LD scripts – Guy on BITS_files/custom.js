(function ($) {
  "use strict";
    $(document).ready(function() {
        // scrolltop
        $('body').materialScrollTop({
            revealElement: 'header',
            revealPosition: 'button',
            onScrollEnd: function() {
                console.log('Scrolling End');
            }
        });

        // pre loader
        $(window).on('load', function(){
          $('.preloader').fadeOut(750); // set duration in brackets    
        });

        // menu scroll
        $('#menu').hcSticky();

        // scroll-down
        $('.comment-list a').click(function(){
            $('html, body').animate({
                scrollTop: $( $(this).attr('href') ).offset().top
            }, 1000);
            return false;
        });
    });

  
})(jQuery);