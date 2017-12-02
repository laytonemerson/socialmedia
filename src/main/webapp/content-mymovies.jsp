<%@include file="taglib.jsp"%>

<script type="text/javascript" class="init" src="Javascript/myMovieTable.js"></script>

<div class="container-fluid">

    <br><br><br>

    <div class="row">
        <div class="col-md-2">
            <h2>My Movies</h2>
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
                    <td>${current.movieId}</td>
                    <c:choose>
                        <c:when test="${empty current.moviePoster}">
                            <td><img src="Images/noimagesm.png" ></td>
                        </c:when>
                        <c:otherwise>
                            <td><img src="https://image.tmdb.org/t/p/w92${current.moviePoster}" alt="${current.moviePoster}"></td>
                        </c:otherwise>
                    </c:choose>
                    <td>${current.movieTitle}</td>
                    <td>${current.movieDate}</td>
                    <td>${current.moviePlot}</td>
                    <td><button type="button" id="${current.movieId}" class="btndel btn btn-xs btn-danger"><span class="glyphicon glyphicon-minus"></span></button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <c:import url="Modals/deleteMovieModal.jsp" />

</div>