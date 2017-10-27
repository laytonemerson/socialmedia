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
            "searching": true
        } );

        $('#movieTable tbody').on('click', '.btnadd', function () {
            var id = $(this).closest("tr").find("td:eq(0)").text();
            var poster = $(this).closest("tr").find("img").attr("src");
            var title = $(this).closest("tr").find("td:eq(2)").text();
            var date = $(this).closest("tr").find("td:eq(3)").text();
            var plot = $(this).closest("tr").find("td:eq(4)").text();
            var mymodal = $('#addMovieModal');

            mymodal.find('.modal-title').text("Would you like to add '" + title + "'?");
            mymodal.find('#movie_id').val(id);
            $('#movie_poster').attr('src',poster);
            mymodal.find('#movie_title').val(title);
            mymodal.find('#movie_date').val(date);
            mymodal.find('#movie_plot').val(plot);

            mymodal.find('#poster_path').val(poster);

            $('#addMovieModal').modal('show');
        });

    } );

</script>

<script>
    $(document).on("submit", "#add_form", function(event) {
        var $form = $(this);
        var id = document.getElementById("movie_id").value;

        $('#addMovieModal').modal('hide');

        $.post($form.attr("action"), $form.serialize(), function(response) {
            var btnadd = $('#' + id);
            btnadd.removeClass("btn-success").addClass("btn-default");
            btnadd.find('span').toggleClass('glyphicon-plus').toggleClass('glyphicon-check');
            btnadd.attr('disabled','disabled');
        });

        event.preventDefault(); // Important! Prevents submitting the form.
    });
</script>

<div class="container-fluid">


    <div class="row">
        <div class="col-md-5 col-md-offset-1">
            <h2>Search for movies with a keyword</h2>
            <br>
        </div>
    </div>

    <div class="row">

        <form class="form-horizontal" action="performMovieSearch" method="post" id="search_form">
            <fieldset>

                <%-- Keyword --%>

                <div class="form-group">
                    <label class="col-md-2 control-label">Keyword*</label>
                    <div class="col-md-5  inputGroupContainer">
                        <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                            <input name="keyword" placeholder="Keyword Text" required class="form-control" type="text">
                        </div>
                    </div>
                </div>

                <%-- Button --%>

                <div class="form-group">
                    <label class="col-md-2 control-label"></label>
                    <div class="col-md-5">
                        <button type="submit" class="btn btn-primary" >Search <span class="glyphicon glyphicon-search"></span></button>
                    </div>
                </div>

            </fieldset>
        </form>
    </div>

    <div class="row">

        <c:choose>
            <c:when test="${searchPerformed == true}">
                <h4>Showing results for "${keyword}"</h4>
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
                                <td>${current.getId()}</td>
                                <c:choose>
                                    <c:when test="${empty current.getPosterPath()}">
                                        <td><img src="Images/noimagesm.png" ></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><img src="https://image.tmdb.org/t/p/w92${current.getPosterPath()}"></td>
                                    </c:otherwise>
                                </c:choose>
                                <td>${current.getTitle()}</td>
                                <td>${current.getReleaseDate()}</td>
                                <td>${current.getOverview()}</td>
                                <c:choose>
                                    <c:when test="${current.userHas() == false}">
                                        <td><button type="button" id="${current.getId()}" class="btnadd btn btn-xs btn-success"><span class="glyphicon glyphicon-plus"></span></button></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><button type="button" id="${current.getId()}" class="btndel btn btn-xs btn-default disabled"><span class="glyphicon glyphicon-check"></span></button></td>
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
        </c:choose>
    </div>


    <!-- Add Modal -->
    <div id="addMovieModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Movie</h4>
                </div>
                <div class="modal-body" style="padding: 10px;">
                    <form class="form-horizontal" action="addMovie" method="post"  id="add_form">
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
                                <button type="submit" class="btn btn-success" >Yes </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div><!-- modal -->

</div> <!-- End Container -->