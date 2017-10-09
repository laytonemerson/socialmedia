<div class="container">

    <form class="form-horizontal" action="performSignup" method="post"  id="reg_form">

        <fieldset>

            <%-- Form Title --%>

            <legend>Sign up for a Social Media Account</legend>

                <%-- First Name --%>

                <div class="form-group">
                    <label class="col-md-2 control-label">First Name*</label>
                    <div class="col-md-5  inputGroupContainer">
                        <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input name="first_name" placeholder="First Name" class="form-control"  type="text">
                        </div>
                    </div>
                </div>

                <%-- Last Name --%>

                <div class="form-group">
                    <label class="col-md-2 control-label">Last Name*</label>
                    <div class="col-md-5  inputGroupContainer">
                        <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input name="last_name" placeholder="Last Name" class="form-control"  type="text">
                        </div>
                    </div>
                </div>

                <%-- Email Address --%>

                <div class="form-group">
                    <label class="col-md-2 control-label">E-Mail*</label>
                    <div class="col-md-5  inputGroupContainer">
                        <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                            <input name="email" placeholder="E-Mail Address" class="form-control"  type="text">
                        </div>
                    </div>
                </div>

                <%-- User Name --%>

                <div class="form-group">
                    <label class="col-md-2 control-label">User Name*</label>
                    <div class="col-md-5  inputGroupContainer">
                        <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input name="user_name" placeholder="User Name" class="form-control"  type="text">
                        </div>
                    </div>
                </div>

                <%-- Password --%>

                <div class="form-group has-feedback">
                    <label for="password"  class="col-md-2 control-label">Password* </label>
                    <div class="col-md-5  inputGroupContainer">
                        <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input class="form-control" id="password" type="password" placeholder="Password"
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
                    <label for="confirmPassword"  class="col-md-2 control-label">Confirm Password*</label>
                    <div class="col-md-5  inputGroupContainer">
                        <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input class="form-control {$borderColor}" id="confirmPassword" type="password" placeholder="Confirm password"
                                   name="confirmPassword" data-match="#confirmPassword" data-minLength="5"
                                   data-match-error="some error 2"
                                   required/>
                            <span class="glyphicon form-control-feedback"></span>
                            <span class="help-block with-errors"></span>
                        </div>
                    </div>
                </div>

                <%-- Button --%>

                <div class="form-group">
                    <label class="col-md-2 control-label"></label>
                    <div class="col-md-5">
                        <button type="submit" class="btn btn-primary" >Create Account <span class="glyphicon glyphicon-send"></span></button>
                    </div>
                </div>

        </fieldset>
    </form>
</div>

<script type="text/javascript" src="validateSignUp.js"></script>