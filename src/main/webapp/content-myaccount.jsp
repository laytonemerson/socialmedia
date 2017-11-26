<%@include file="taglib.jsp"%>
<div class="container-fluid">
    <br><br><br>
    <div class="row">
        <div class="col-md-2 col-md-offset-1">
            <center>
                <h3>Account Management</h3>
                <img src="Images/account.png" class="img-fluid" alt="Account image">
            </center>
            <br>
            <ul class="list-group list-group-flush">
                <li class="list-group-item"><strong>User Name: </strong> ${user.userName}</li>
                <li class="list-group-item"><strong>First Name: </strong> ${user.firstName}</li>
                <li class="list-group-item"><strong>Last Name: </strong>  ${user.lastName}</li>
                <li class="list-group-item"><strong>Email Address: </strong> ${user.emailAddress}</li>
                <li class="list-group-item"><strong>Password: </strong>  *******</li>
                <li class="list-group-item"><strong>Profile Picture: </strong><img src="${user.userPicture}" class="img-responsive"></li>
                <li class="list-group-item"><span><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editAccountModal">Edit Account Information</button></span></li>
                <li class="list-group-item"><span><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteAccountModal">Delete Account</button></span></li>
            </ul>
        </div>
        <div class="col-md-2 col-md-offset-2">
            <center>
                <h3>Friend Management</h3>
                <img src="Images/friend.png" class="img-fluid" alt="Friend image">
            </center>
            <br>
            <ul class="list-group list-group-flush">
                <li class="list-group-item"><strong>Number of friends: </strong> ${friendCount}</li>
                <li class="list-group-item"><a href="showFriendManager"><span><button type="button" class="btn btn-primary">Manage Friends</button></span></a></li>
                <li class="list-group-item"><a href="showFriendMovies"><span><button type="button" class="btn btn-primary" >Search Friends' Inventory</button></span></a></li>
            </ul>
        </div>
        <div class="col-md-2 col-md-offset-2">
            <center>
                <h3>Media Management</h3>
                <img src="Images/movie.png" class="img-fluid" alt="Movie image">
            </center>
            <br>
            <ul class="list-group list-group-flush">

                <li class="list-group-item"><strong>Number of movies: </strong> ${movieCount}</li>
                <c:choose>
                    <c:when test="${movieCount gt 0}">
                        <li class="list-group-item">
                            <center>
                                <div id="movieCarousel" class="carousel slide" style="width: 185px; margin: 0 auto">
                                    <!-- Wrapper for slides -->
                                    <div class="carousel-inner">
                                        <c:forEach var="current" items="${movies}" varStatus="stat">

                                            <c:choose>
                                                <c:when test="${empty current.moviePoster}">
                                                    <c:set var="poster" value = "Images/noimagemd.png"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:set var="poster" value="https://image.tmdb.org/t/p/w185${current.moviePoster}"/>
                                                </c:otherwise>
                                            </c:choose>

                                            <c:choose>
                                                <c:when test="${stat.first}">
                                                    <div class="item active">
                                                        <img src="${poster}"/>
                                                    </div>
                                                </c:when>
                                                <c:otherwise>
                                                    <div class="item">
                                                        <img src="${poster}"/>
                                                    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </div>
                                    <!-- Left and right controls -->
                                    <a class="left carousel-control" href="#movieCarousel" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="right carousel-control" href="#movieCarousel" data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                            </center>
                        </li>
                    </c:when>
                </c:choose>
                <li class="list-group-item"><a href="showMovieSearch"><span><button type="button" class="btn btn-primary">Add to My Collection</button></span></a>
                <li class="list-group-item"><a href="showMyMovies"><span><button type="button" class="btn btn-primary" >View/Edit My Collection</button></span></a>
                </li>
            </ul>
        </div>

    </div>

    <c:import url="editModal.jsp" />
    <c:import url="deleteModal.jsp" />

</div> <!-- End Container -->

<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>
<script type="text/javascript" src="validateAccountEdit.js"></script>