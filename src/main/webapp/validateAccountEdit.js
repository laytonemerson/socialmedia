
$(document).ready(function() {
    $('#edit_form').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            first_name: {
                validators: {
                    stringLength: {
                        min: 2,
                        max: 20,
                        message: 'The first name must be between 2 and 20 characters long'
                    },
                    notEmpty: {
                        message: 'Please supply your first name'
                    }
                }
            },
            user_name: {
                validators: {
                    stringLength: {
                        min: 2,
                        max: 15,
                        message: 'The user name must be between 2 and 15 characters long'
                    },
                    notEmpty: {
                        message: 'Please supply your user name'
                    }
                }
            },
            last_name: {
                validators: {
                    stringLength: {
                        min: 2,
                        max: 20,
                        message: 'The last name must be between 2 and 20 characters long'

                    },
                    notEmpty: {
                        message: 'Please supply your last name'
                    }
                }
            },

            email: {
                validators: {
                    stringLength: {
                        min: 4,
                        max: 60,
                        message: 'Email address must be between 4 and 60 characters long'

                    },
                    notEmpty: {
                        message: 'Please supply your email address'
                    },
                    emailAddress: {
                        message: 'Please supply a valid email address'
                    }
                }
            },

            bio: {
                validators: {
                    stringLength: {
                        max: 250,
                        message:'Please enter no more than 250 characters'
                    }
                }
            },

            password: {
                validators: {
                    stringLength: {
                        min: 5,
                        max: 15,
                        message: 'The password must be between 5 and 15 characters long'
                    },
                    notEmpty: {
                        message: 'Please supply your password'
                    },
                    identical: {
                        field: 'confirmPassword',
                        message: 'Confirm your password below'
                    }
                }
            },
            confirmPassword: {
                validators: {
                    stringLength: {
                        min: 5,
                        max: 15,
                    },
                    notEmpty: {
                        message: 'Please confirm your password'
                    },
                    identical: {
                        field: 'password',
                        message: 'Incorrect password confirmation'
                    }
                }
            }
        }
    })

        .on('success.form.bv', function(e) {
            $('#success_message').slideDown({ opacity: "show" }, "slow") // Do something ...
            $('#edit_form').data('bootstrapValidator').resetForm();

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