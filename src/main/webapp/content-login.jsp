<div class="container">
    <form class="form-horizontal" action="performSignup" method="post"  id="login_form">
        <fieldset>

            <%-- Form Title --%>

            <legend>Sign up for a Social Media Account</legend>

            <br>

            <c:if test="${newUser == true}">
                <h5>Welcome to social media ${newUserName}. Please log in to start adding friends and inventory.</h5>
            </c:if>

            <%-- User Name --%>

            <div class="form-group">
                <label class="col-sm-2 control-label">User Name*</label>
                <div class="col-sm-5  inputGroupContainer">
                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input name="user_name" placeholder="User Name" class="form-control"  type="text">
                    </div>
                </div>
            </div>

            <%-- Password --%>

            <div class="form-group has-feedback">
                <label for="password"  class="col-sm-2 control-label">Password* </label>
                <div class="col-sm-5  inputGroupContainer">
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

            <%-- Button --%>

            <div class="form-group">
                <label class="col-sm-2 control-label"></label>
                <div class="col-sm-5">
                    <button type="submit" class="btn btn-primay" >Send <span class="glyphicon glyphicon-log-in"></span></button>
                </div>
            </div>

        </fieldset>
    </form>
</div>

<script type="text/javascript" src="validateLogIn.js"></script>