$(document).ready( function () {

    $('#userTable').dataTable( {
        "aoColumnDefs": [
            { "bSortable": false, "aTargets": [ 1, 5, 6 ] }
        ],
        "columns": [
            { "width": "10%" },
            { "width": "10%" },
            { "width": "10%" },
            { "width": "10%" },
            { "width": "10%" },
            { "width": "45%" },
            { "width": "5%" }
        ],
        "aaSorting": [],
        "bPaginate": true,
        "searching": true
    } );

    $('#userTable tbody').on('click', '.btnfriend', function () {

        var user_name = $(this).closest("tr").find("td:eq(0)").text();
        var pic_url = $(this).closest("tr").find("img").attr("src");
        var first_name = $(this).closest("tr").find("td:eq(2)").text();
        var last_name = $(this).closest("tr").find("td:eq(3)").text();
        var movie_count = $(this).closest("tr").find("td:eq(4)").text();
        var bio = $(this).closest("tr").find("td:eq(5)").text();
        var btn = $('#' + user_name);
        var btn_class = btn.attr('class');

        if (btn_class === "btnfriend btn btn-xs btn-danger") {
            var mymodal = $('#adminDeleteModal');
            mymodal.find('.modal-title').text("Would you like to delete " + first_name + " " + last_name + "?");
            mymodal.find('#user_name_del').val(user_name);
            $('#user_pic_del').attr('src',pic_url);
            mymodal.find('#user_first_del').val(first_name);
            mymodal.find('#user_last_del').val(last_name);
            mymodal.find('#user_count_del').val(movie_count);
            mymodal.find('#user_bio_del').val(bio);
            mymodal.modal('show');
        }
    });
} );