
$("#file1").fileinput({
    language: "pt-BR",
    showUpload: false,
    showRemove: false,
    mainClass: "input-group-sm"
});
$(document).scroll(
    function () {
        if ($(document).scrollTop() >= 100) {
            $('#btnUp').removeClass('invisible');
        } else {
            $('#btnUp').addClass('invisible');
        }
    }
);