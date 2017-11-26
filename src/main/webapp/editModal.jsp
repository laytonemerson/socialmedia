<!-- Edit Modal -->
<div id="editAccountModal" class="modal fade" role="dialog">

    <div class="modal-dialog modal-lg">

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
                            <label class="col-md-2 control-label">User Name*</label>
                            <div class="col-md-9  ">
                                <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input name="user_name" id="user_name" placeholder="User Name" class="form-control"  type="text" readonly
                                           value="${user.userName}">
                                </div>
                            </div>
                        </div>

                        <%-- First Name --%>

                        <div class="form-group">
                            <label class="col-md-2 control-label">First Name*</label>
                            <div class="col-md-9  inputGroupContainer">
                                <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input name="first_name" id="first_name" placeholder="First Name" class="form-control"  type="text"
                                           value="${user.firstName}">
                                </div>
                            </div>
                        </div>

                        <%-- Last Name --%>

                        <div class="form-group">
                            <label class="col-md-2 control-label">Last Name*</label>
                            <div class="col-md-9  ">
                                <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <input name="last_name" id="last_name" placeholder="Last Name" class="form-control"  type="text"
                                           value="${user.lastName}">
                                </div>
                            </div>
                        </div>

                        <%-- Email Address --%>

                        <div class="form-group">
                            <label class="col-md-2 control-label">E-Mail*</label>
                            <div class="col-md-9  ">
                                <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                    <input name="email" id="email" placeholder="E-Mail Address" class="form-control"  type="text"
                                           value="${user.emailAddress}">
                                </div>
                            </div>
                        </div>


                        <%-- Password --%>

                        <div class="form-group has-feedback">
                            <label for="password"  class="col-md-2 control-label">Password* </label>
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
                            <label for="confirmPassword"  class="col-md-2 control-label">Confirm*</label>
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
                            <label class="col-md-2 control-label">User Bio</label>
                            <div class="col-md-9  inputGroupContainer">
                                <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-info-sign"></i></span>
                                    <textarea style="resize:vertical;" class="form-control" rows="5" name="bio" id="bio">${user.userBio}</textarea>
                                </div>
                            </div>
                        </div>

                        <%-- Profile Picture --%>

                        <div class="form-group">
                            <label class="col-md-2 control-label">Profile Picture</label>
                            <div class="col-md-9  ">
                                <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-picture"></i></span>
                                    <input name="picurl" id="picurl" placeholder="" class="form-control"  type="text"
                                           value="${user.userPicture}"  />
                                </div>
                                <span class="help-block">Provide the URL to your profile picture</span>
                            </div>
                        </div>

                        <%-- Button --%>

                        <div class="form-group">
                            <label class="col-md-2 control-label"></label>
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