<%@include file="taglib.jsp"%>

<script type="text/javascript" class="init" src="Javascript/friendmoviesTable.js"></script>
<script type="text/javascript" src="Javascript/friendmoviesSubmit.js"></script>

<div class="container-fluid">

    <br><br><br>

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
                            <td><button type="button" id="${currentFriend.userName}${currentMovie.movieId}" class="btnask btn btn-xs btn-primary"><span class="glyphicon glyphicon-envelope"></span></button></td>
                        </tr>
                    </c:forEach>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <c:import url="Modals/emailFriendModal.jsp" />
</div>