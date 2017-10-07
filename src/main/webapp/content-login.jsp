<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
    <form class="form-horizontal" action="j_security_check" method="post" id="login_form">
        <fieldset>

            <%-- Form Title --%>

            <legend>Sign in to your Social Media Account</legend>

                <c:choose>
                    <c:when test="${newUser == true}">
                        <h5>Welcome to Social Media ${newUserName}. Please sign in to start adding friends and inventory.</h5>
                        <br>
                    </c:when>
                </c:choose>

            <%-- User Name --%>

            <div class="form-group">
                <label class="col-sm-2 control-label">User Name*</label>
                <div class="col-sm-5  inputGroupContainer">
                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input name="j_username" placeholder="User Name" class="form-control" id="j_username" type="text">
                    </div>
                </div>
            </div>

            <%-- Password --%>

            <div class="form-group has-feedback">
                <label for="j_password"  class="col-sm-2 control-label">Password* </label>
                <div class="col-sm-5  inputGroupContainer">
                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input class="form-control" id="j_password" type="password" placeholder="Password"
                               name="j_password" data-minLength="5"
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
                    <button type="submit" class="btn btn-primary" >Sign In <span class="glyphicon glyphicon-log-in"></span></button>
                </div>
            </div>

        </fieldset>
    </form>
</div>

<script type="text/javascript" src="validateLogIn.js"></script>