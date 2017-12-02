
$.fn.dataTable.ext.search.push(
    function( settings, data, dataIndex ) {
        var e = document.getElementById("friendSelect");
        var strUser = e.options[e.selectedIndex].value;
        var user = data[5];

        if ( strUser === user || strUser === "") {
            return true;
        }
        return false;
    }
);

$(document).ready(function() {
    var table = $('#movieTable').DataTable({  "aoColumnDefs": [
        { "bSortable": false, "aTargets": [ 0, 1, 4, 6 ] }
    ],

        "columns": [
            { "width": "5%" },
            { "width": "5%" },
            { "width": "20%" },
            { "width": "12%" },
            { "width": "40%" },
            { "width": "13%" },
            { "width": "5%" }
        ],
        "aaSorting": [],
        "bPaginate": true,
        "order": [[ 2, "asc" ]],
        "searching": true
    } );

    // Event listener to the two range filtering inputs to redraw on input
    $('#friendSelect').click( function() {
        table.draw();
    } );

    $('#movieTable tbody').on('click', '.btnask', function () {
        var id = $(this).closest("tr").find("td:eq(0)").text();
        var title = $(this).closest("tr").find("td:eq(2)").text();
        var to_user = $(this).closest("tr").find("td:eq(5)").text();
        var mymodal = $('#emailFriendModal');
        mymodal.find('.modal-title').text("Send email to " + to_user);
        mymodal.find('#email_subject').val("Can I borrower " + title + "?");
        mymodal.find('#to_user').val(to_user);
        mymodal.find('#movie_id').val(id);
        mymodal.find('#email_body').val('Hello,\n\nI was browsing your movies and really want to borrow ' + title +
            '.\n\nI promise to give it right back :)\n\nCheers!\n');
        mymodal.modal('show');
    });
} );