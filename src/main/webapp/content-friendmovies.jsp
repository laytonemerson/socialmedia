<%@include file="taglib.jsp"%>

<script type="text/javascript" class="init">

    $.fn.dataTable.ext.search.push(
        function( settings, data, dataIndex ) {
            var e = document.getElementById("friendSelect");
            var strUser = e.options[e.selectedIndex].value;
            var user = data[5];  // use data for the age column;

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
            var user = $(this).closest("tr").find("td:eq(5)").text();
            alert("Hey " + user + ", can I borrow " + id + "?");
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
        <div class="col-md-2 ">
            <div class="form-group">
                <label for="friendSelect">Only View Movies From:</label>
                <select class="form-control" id="friendSelect">
                    <option value="">All</option>
                    <c:forEach var="currentFriend" items="${friends}">
                        <option>${currentFriend.userName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
    </div>

    <br>

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