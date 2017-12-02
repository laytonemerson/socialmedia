$(document).on("submit", "#email_form", function(event) {
    var $form = $(this);
    var id = document.getElementById("movie_id").value;
    var to_user = document.getElementById("to_user").value;
    var btnemail = $('#' + to_user + id);
    $('#emailFriendModal').modal('hide');

    $.post($form.attr("action"), $form.serialize(), function(response) {
        btnemail.removeClass("btn-primary").addClass("btn-default");
        btnemail.find('span').toggleClass('glyphicon-envelope').toggleClass('glyphicon-check');
        btnemail.attr('disabled','disabled');
    });

    event.preventDefault(); // Important! Prevents submitting the form.
});