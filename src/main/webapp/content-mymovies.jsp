<%@include file="taglib.jsp"%>

<script type="text/javascript" class="init">
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
                { "width": "5%" },
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

</script>

<div class="container-fluid">

    <div class="row">
        <div class="col-md-2">
            <h2>My movies</h2>
            <br>
        </div>
    </div>

    <div class="row">

        <table id="movieTable" class="display" cellspacing="0" width="100%">
            <thead>
            <th>Movie ID</th>
            <th></th>
            <th>Movie Title</th>
            <th>Release Date</th>
            <th>Plot/Overview</th>
            <th></th>
            </thead>

            <tbody>
            <c:forEach var="current" items="${movies}">
                <tr>
                    <td>${current.getMovieId()}</td>
                    <c:choose>
                        <c:when test="${empty current.getmoviePoster()}">
                            <td><img src="Images/noimagesm.png" ></td>
                        </c:when>
                        <c:otherwise>
                            <td><img src="https://image.tmdb.org/t/p/w92${current.getmoviePoster()}"></td>
                        </c:otherwise>
                    </c:choose>
                    <td>${current.getMovieTitle()}</td>
                    <td>${current.getmovieDate()}</td>
                    <td>${current.getmoviePlot()}</td>
                    <td><button type="button" id="${current.getMovieId()}" class="btndel btn btn-xs btn-danger"><span class="glyphicon glyphicon-minus"></span></button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Delete Modal -->
    <div id="deleteMovieModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Delete Movie</h4>
                </div>
                <div class="modal-body" style="padding: 10px;">
                    <form class="form-horizontal" action="deleteMovie" method="post"  id="delete_form">
                        <input type="HIDDEN" name="poster_path" id="poster_path">
                        <div class="row">
                            <label class="col-md-2 control-label">Poster</label>
                            <div class="col-lg-2 col-md-2 col-sm-2" style="padding-bottom: 10px;" style="padding-top: 10px;">
                                <img src="" name="movie_poster" id="movie_poster">
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-md-2 control-label">ID</label>
                            <div class="col-lg-2 col-md-2 col-sm-2" style="padding-bottom: 10px;" style="padding-top: 10px;">
                                <input id="movie_id" name ="movie_id" class="form-control"  type="text" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-md-2 control-label">Release Date</label>
                            <div class="col-lg-2 col-md-2 col-sm-2" style="padding-bottom: 10px;">
                                <input id="movie_date" name ="movie_date" class="form-control"  type="text" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-md-2 control-label">Title</label>
                            <div class="col-lg-9 col-md-9 col-sm-9" style="padding-bottom: 10px;">
                                <input id="movie_title" name ="movie_title" class="form-control"  type="text" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-md-2 control-label">Plot</label>
                            <div class="col-lg-9 col-md-9 col-sm-9" style="padding-bottom: 10px;">
                                <textarea style="resize:vertical;" class="form-control" rows="8" name="movie_plot" id="movie_plot" readonly></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2 col-lg-offset-2 col-md-2 col-md-offset-2 col-sm-2 col-sm-offset-2" style="padding-bottom: 10px;">
                                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                                <button type="submit" class="btn btn-danger" >Yes </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div><!-- modal -->

</div>