$(function () {
    var frm = $('#js-check-availability-form');
    frm.submit(function (ev) {
        $.ajax({
            type: frm.attr('method'),
            url: frm.attr('action'),
            data: frm.serialize(),
            success: function (data) {
                $('#js-available').html(data);
            }
        });
        ev.preventDefault();
    });
});