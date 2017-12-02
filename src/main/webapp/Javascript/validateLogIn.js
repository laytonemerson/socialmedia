
$(document).ready(function() {
    $('#login_form').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            j_username: {
                validators: {
                    notEmpty: {
                        message: 'Please supply your user name'
                    }
                }
            },
            j_password: {
                validators: {
                    notEmpty: {
                        message: 'Please supply your password'
                    }
                }
            }
        }
    })

        .on('success.form.bv', function(e) {
            $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
            $('#login_form').data('bootstrapValidator').resetForm();

            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);

            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');

            // Use Ajax to submit form data
            $.post($form.attr(''), $form.serialize(), function(result) {
                console.log(result);
            }, 'json');
        });
});