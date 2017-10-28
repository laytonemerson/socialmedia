<%@include file="taglib.jsp"%>
<div class="container-fluid">

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
                <li class="list-group-item"><a href="searchFriendInventory"><span><button type="button" class="btn btn-primary" >Search Friends' Inventory</button></span></a></li>
            </ul>
        </div>
        <div class="col-md-2 col-md-offset-2">
            <center>
                <h3>Media Management</h3>
                <img src="Images/movie.png" class="img-fluid" alt="Movie image">
            </center>
            <br>
            <ul class="list-group list-group-flush">

                <li class="list-group-item"><strong>Number of movies: </strong> ${movieCount}

                    <c:choose>
                        <c:when test="${movieCount gt 0}">
                            <br>
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
                        </c:when>
                </c:choose>

                </li>
                <li class="list-group-item"><a href="showMovieSearch"><span><button type="button" class="btn btn-primary">Add to My Collection</button></span></a>
                <li class="list-group-item"><a href="showMyMovies"><span><button type="button" class="btn btn-primary" >View/Edit My Collection</button></span></a>
                </li>
            </ul>
        </div>

    </div>

    <!-- Edit Modal -->
    <div id="editAccountModal" class="modal fade" role="dialog">

        <div class="modal-dialog">

            <div class="modal-content">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Edit Account Information</h4>
                </div>

                <div class="modal-body">

                    <form class="form-horizontal" action="updateAccount" method="post"  id="edit_form">

                        <fieldset>

                            <%-- User Name --%>

                            <div class="form-group">
                                <label class="col-md-3 control-label">User Name*</label>
                                <div class="col-md-9  ">
                                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input name="user_name" placeholder="User Name" class="form-control"  type="text" readonly
                                               value="${user.userName}">
                                    </div>
                                </div>
                            </div>

                            <%-- First Name --%>

                            <div class="form-group">
                                <label class="col-md-3 control-label">First Name*</label>
                                <div class="col-md-9  inputGroupContainer">
                                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input name="first_name" placeholder="First Name" class="form-control"  type="text"
                                               value="${user.firstName}">
                                    </div>
                                </div>
                            </div>

                            <%-- Last Name --%>

                            <div class="form-group">
                                <label class="col-md-3 control-label">Last Name*</label>
                                <div class="col-md-9  ">
                                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input name="last_name" placeholder="Last Name" class="form-control"  type="text"
                                               value="${user.lastName}">
                                    </div>
                                </div>
                            </div>

                            <%-- Email Address --%>

                            <div class="form-group">
                                <label class="col-md-3 control-label">E-Mail*</label>
                                <div class="col-md-9  ">
                                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                        <input name="email" placeholder="E-Mail Address" class="form-control"  type="text"
                                               value="${user.emailAddress}">
                                    </div>
                                </div>
                            </div>


                            <%-- Password --%>

                            <div class="form-group has-feedback">
                                <label for="password"  class="col-md-3 control-label">Password* </label>
                                <div class="col-md-9  ">
                                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input class="form-control" id="password" type="password" placeholder="Password"
                                               name="password" data-minLength="5"
                                               data-error="some error"
                                                value="${user.password}"  />
                                        <span class="glyphicon form-control-feedback"></span>
                                        <span class="help-block with-errors"></span>
                                    </div>
                                </div>
                            </div>

                            <%-- Confirm Password --%>

                            <div class="form-group has-feedback">
                                <label for="confirmPassword"  class="col-md-3 control-label">Confirm*</label>
                                <div class="col-md-9  ">
                                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input class="form-control {$borderColor}" id="confirmPassword" type="password" placeholder="Confirm password"
                                               name="confirmPassword" data-match="#confirmPassword" data-minLength="5"
                                               data-match-error="some error 2"  value="${user.password}"  />
                                        <span class="glyphicon form-control-feedback"></span>
                                        <span class="help-block with-errors"></span>
                                    </div>
                                </div>
                            </div>

                            <%-- User Bio --%>

                            <div class="form-group">
                                <label class="col-md-3 control-label">User Bio</label>
                                <div class="col-md-9  inputGroupContainer">
                                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
                                        <textarea style="resize:vertical;" class="form-control" rows="5" name="bio" >${user.userBio}</textarea>
                                    </div>
                                </div>
                            </div>

                            <%-- Profile Picture --%>

                            <div class="form-group">
                                <label class="col-md-3 control-label">Profile Picture</label>
                                <div class="col-md-9  ">
                                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-picture"></i></span>
                                        <input name="picurl" placeholder="" class="form-control"  type="text"
                                               value="${user.userPicture}"  />
                                    </div>
                                    <span class="help-block">Provide the URL to your profile picture</span>
                                </div>
                            </div>

                            <%-- Button --%>

                            <div class="form-group">
                                <label class="col-md-3 control-label"></label>
                                <div class="col-md-5">
                                    <button type="submit" class="btn btn-primary" >Update Account <span class="glyphicon glyphicon-send"></span></button>
                                </div>
                            </div>

                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div><!-- modal -->


    <!-- Delete Modal -->
    <div id="deleteAccountModal" class="modal fade" role="dialog">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Delete Account</h4>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete your account?</p>

                    <form class="form-horizontal" action="deleteAccount" method="post"  id="delete_form">

                        <%-- User Name --%>
                        <div class="form-group">
                            <label class="col-md-3 control-label">User Name*</label>
                            <div class="col-md-9  ">
                                <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input name="user_name" placeholder="User Name" class="form-control"  type="text" readonly
                                           value="${user.userName}">
                                </div>
                            </div>
                        </div>

                        <%-- Button --%>
                        <div class="form-group">
                            <label class="col-md-3 control-label"></label>
                            <div class="col-md-5">
                                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                                <button type="submit" class="btn btn-danger" >Yes </button>
                            </div>
                        </div>

                    </form>
                </div>

                <div class="modal-footer">

                </div>
            </div>
        </div>
    </div><!-- modal -->

</div> <!-- End Container -->

<script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>
<script type="text/javascript" src="validateAccountEdit.js"></script>