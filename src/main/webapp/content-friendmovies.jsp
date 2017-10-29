<%@include file="taglib.jsp"%>

<script type="text/javascript" class="init">
    $(document).ready( function () {

        $('#movieTable').dataTable( {
            "aoColumnDefs": [
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

        $('#movieTable tbody').on('click', '.btnask', function () {
            var id = $(this).closest("tr").find("td:eq(0)").text();
            alert("I want to borrow " + id);
        });

    } );
</script>

<div class="container-fluid">

    <div class="row">
        <div class="col-md-2">
            <h2>My Friends' Movies</h2>
            <br>
        </div>
    </div>

    <div class="row">
        <div class="form-group">
              <label for="friendSelect">View movies from only:</label>
              <select class="form-control" id="friendSelect">
                <c:forEach var="currentFriend" items="${friends}">
                    <option>${currentFriend.userName}</option>
                </c:forEach>
              </select>
        </div>
        <br>
    </div>

    <div class="row">
        <table id="movieTable" class="display" cellspacing="0" width="100%">
            <thead>
            <th>Movie ID</th>
            <th></th>
            <th>Movie Title</th>
            <th>Release Date</th>
            <th>Plot/Overview</th>
            <th>Movie Owner</th>
            <th></th>
            </thead>
            <tbody>
                <c:forEach var="currentFriend" items="${friends}">
                    <c:forEach var="currentMovie" items="${currentFriend.getUserMovies()}">
                        <tr>
                            <td>${currentMovie.movieId}</td>
                            <c:choose>
                                <c:when test="${empty currentMovie.moviePoster}">
                                    <td><img src="Images/noimagesm.png" ></td>
                                </c:when>
                                <c:otherwise>
                                    <td><img src="https://image.tmdb.org/t/p/w92${currentMovie.moviePoster}"></td>
                                </c:otherwise>
                            </c:choose>
                            <td>${currentMovie.movieTitle}</td>
                            <td>${currentMovie.movieDate}</td>
                            <td>${currentMovie.moviePlot}</td>
                            <td>${currentFriend.userName}</td>
                            <td><button type="button" id="${currentMovie.movieId}" class="btnask btn btn-xs btn-primary"><span class="glyphicon glyphicon-envelope"></span></button></td>
                        </tr>
                    </c:forEach>
                </c:forEach>
            </tbody>
        </table>
    </div>

</div>