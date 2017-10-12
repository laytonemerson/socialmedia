$(document).ready(function() {
    $('#editAccountModal').on('hidden.bs.modal', function () {
        $(this).find('form').reset();
    });

});