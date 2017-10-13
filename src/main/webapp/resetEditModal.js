$(document).ready(function()
{
    // codes works on all bootstrap modal windows in application
    $('.modal').on('hidden.bs.modal', function(e)
    {
        $(this).removeData();
    }) ;

});