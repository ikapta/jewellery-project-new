
$(function () {

    $(window).scroll(function() {
        if ($(window).scrollTop() > 350) {
            $("img.airmain").fadeIn(150);
        } else {
            $("img.airmain").fadeOut(150);
        }
    }); 


    $('img.airmain').click(function() {
        $("html,body").animate({ scrollTop: 0 }, 500);
    });


});
