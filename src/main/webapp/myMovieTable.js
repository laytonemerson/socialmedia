$(document).ready( function () {

    $('#movieTable').dataTable( {
        "aoColumnDefs": [
            { "bSortable": false, "aTargets": [ 1, 4, 5 ] }
        ],

        "columns": [
            { "width": "5%" },
            { "width": "5%" },
            { "width": "20%" },
            { "width": "15%" },
            { "width": "50%" },
            { "width": "5%" }
        ],
        "aaSorting": [],
        "bPaginate": true,
        "order": [[ 2, "asc" ]],
        "searching": true
    } );

    $('#movieTable tbody').on('click', '.btndel', function () {
        var id = $(this).closest("tr").find("td:eq(0)").text();
        var poster_url = $(this).closest("tr").find("img").attr("src");
        var poster_path = $(this).closest("tr").find("img").attr("alt");
        var title = $(this).closest("tr").find("td:eq(2)").text();
        var date = $(this).closest("tr").find("td:eq(3)").text();
        var plot = $(this).closest("tr").find("td:eq(4)").text();
        var mymodal = $('#deleteMovieModal');

        mymodal.find('.modal-title').text("Would you like to delete '" + title + "'?");
        mymodal.find('#movie_id').val(id);
        $('#movie_poster').attr('src',poster_url);
        mymodal.find('#movie_title').val(title);
        mymodal.find('#movie_date').val(date);
        mymodal.find('#movie_plot').val(plot);

        mymodal.find('#poster_path').val(poster_path);

        $('#deleteMovieModal').modal('show');
    });

} );
