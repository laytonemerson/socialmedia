<%@include file="taglib.jsp"%>
<div class="container-fluid">

    <div class="row">
        <div class="col-md-2 col-md-offset-1">
            <center>
                <h3>Account Management</h3>
                <img src="Images/account.png" class="img-fluid" alt="Account image">
            </center>
            <ul class="list-group list-group-flush">
                <li class="list-group-item"><strong>User Name: </strong> ${user.userName}</li>
                <li class="list-group-item"><strong>First Name: </strong> ${user.firstName}</li>
                <li class="list-group-item"><strong>Last Name: </strong>  ${user.lastName}</li>
                <li class="list-group-item"><strong>Email Address: </strong> ${user.emailAddress}</li>
                <li class="list-group-item"><strong>Password: </strong>  *******</li>
                <li class="list-group-item"><span><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editAccountModal">Edit account information</button></span></li>
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
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Edit Account Information</h4>
                </div>

                <div class="modal-body">

                    <form class="form-horizontal" action="updateAccount" method="post"  id="account_edit_form">
                        <fieldset>
                            <%-- First Name --%>
                            <div class="form-group">
                                <label class="col-md-3 control-label">First Name*</label>
                                <div class="col-md-9  inputGroupContainer">
                                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input name="first_name" class="form-control"  type="text">
                                    </div>
                                </div>
                            </div>
                            <%-- Last Name --%>
                            <div class="form-group">
                                <label class="col-md-3 control-label">Last Name*</label>
                                <div class="col-md-9  inputGroupContainer">
                                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input name="last_name" class="form-control"  type="text">
                                    </div>
                                </div>
                            </div>
                            <%-- Email Address --%>
                            <div class="form-group">
                                <label class="col-md-3 control-label">E-Mail*</label>
                                <div class="col-md-9  inputGroupContainer">
                                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                        <input name="email" class="form-control"  type="text">
                                    </div>
                                </div>
                            </div>
                            <%-- Password --%>
                            <div class="form-group has-feedback">
                                <label for="password"  class="col-md-3 control-label">Password* </label>
                                <div class="col-md-9  inputGroupContainer">
                                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input class="form-control" id="password" type="password"
                                               name="password" data-minLength="5"
                                               data-error="some error"
                                               required/>
                                        <span class="glyphicon form-control-feedback"></span>
                                        <span class="help-block with-errors"></span>
                                    </div>
                                </div>
                            </div>
                            <%-- Confirm Password --%>
                            <div class="form-group has-feedback">
                                <label for="confirmPassword"  class="col-md-3 control-label">Confirm*</label>
                                <div class="col-md-9  inputGroupContainer">
                                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input class="form-control {$borderColor}" id="confirmPassword" type="password"
                                               name="confirmPassword" data-match="#confirmPassword" data-minLength="5"
                                               data-match-error="some error 2" required/>
                                        <span class="glyphicon form-control-feedback"></span>
                                        <span class="help-block with-errors"></span>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-primary">Save Changes</button>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div><!-- modal -->
</div> <!-- End Container -->

<script type="text/javascript" src="validateAccountEdit.js"></script>

<!--<script type="text/javascript" src="loadEditModal.js"></script>  <script type="text/javascript" src="resetEditModal.js"></script> -->
