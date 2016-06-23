$(document).scroll(
    function () {
        if ($(document).scrollTop() >= 100) {
            $('#btnUp').removeClass('invisible');
        } else {
            $('#btnUp').addClass('invisible');
        }
    }
);