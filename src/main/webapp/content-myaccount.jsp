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
                <li class="list-group-item"><span><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editAccountModal">Edit account information</button></span></li>
                <li class="list-group-item"><span><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#deleteAccountModal">Delete Account</button></span></li>
            </ul>
        </div>
        <div class="col-md-2 col-md-offset-2">
            <center>
                <h3>Friend Management</h3>
                <img src="Images/friend.png" class="img-fluid" alt="Friend image">
            </center>
        </div>
        <div class="col-md-2 col-md-offset-2">
            <center>
                <h3>Media Management</h3>
                <img src="Images/movie.png" class="img-fluid" alt="Movie image">
            </center>
        </div>
    </div>

    <!-- Modal -->
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
                                        <input name="user_name" placeholder="User Name" class="form-control"  type="text"
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
</div> <!-- End Container -->

<script type="text/javascript" src="validateAccountEdit.js"></script>