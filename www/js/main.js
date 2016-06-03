$(document).scroll(
    function () {
        if ($(document).scrollTop() >= 100) {
            $('#navbar1').addClass('navbar-fixed-top');
            $('html').addClass('has-fixed-nav');
        } else {
            $('#navbar1').removeClass('navbar-fixed-top');
            $('html').removeClass('has-fixed-nav');
        }
    }
);
$("#file1").fileinput({
    language: "pt-BR",
    showUpload: false,
    showRemove: false,
    mainClass: "input-group-sm"
});