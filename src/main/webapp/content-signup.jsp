<%@include file="taglib.jsp"%>
<div class="container">
    <h2>Create a Social Media Account</h2>
    <br>
    <form class="form-horizontal" action="/performSignup" method="post">

        <c:choose>
            <c:when test="${userTakenError == true}">
                <div class="form-group has-error">
                    <label for="input_user_name_taken" class="control-label col-sm-2">User Name*</label>
                    <div class="col-xs-4">
                        <input type="text" maxlength="15" value="${userName}" class="form-control form-control-danger"
                               name="input_user_name" id="input_user_name_taken" placeholder="Up to 15 Chars" required>
                        <div class="help-block">
                            Sorry, that username's taken.
                        </div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="form-group">
                    <label for="input_user_name" class="control-label col-sm-2" >User Name*</label>
                    <div class="col-xs-4">
                        <input type="text" maxlength="15" value="${userName}"class="form-control" name="input_user_name"
                               id="input_user_name" placeholder="Up to 15 Chars" required>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>


        <div class="form-group">
            <label for="input_email" class="control-label col-sm-2">Email Address*</label>
            <div class="col-xs-4">
                <input type="email" maxlength="60" value="${emailAddress}"class="form-control" name=input_email
                       id="input_email" placeholder="emailaddress@email.com" required>
            </div>
        </div>
        <div class="form-group">
            <label for="input_first_name" class="control-label col-sm-2">First Name*</label>
            <div class="col-xs-4">
                <input type="text" maxlength="15" value="${firstName}"class="form-control" name="input_first_name"
                       id="input_first_name" placeholder="John" required>
            </div>
        </div>
        <div class="form-group">
            <label for="input_last_name" class="control-label col-sm-2">Last Name*</label>
            <div class="col-xs-4">
                <input type="text" maxlength="20" value="${lastName}" class="form-control" name=input_last_name
                       id="input_last_name" placeholder="Smith" required>
            </div>
        </div>
        <br>

        <c:choose>
            <c:when test="${passwordError == true}">
                <div class="form-group has-error">
                    <label for="input_pass1" class="control-label col-sm-2">Password*</label>
                    <div class="col-xs-4">
                        <input type="password" value="" maxlength="15" class="form-control" name=input_pass1
                               id="input_pass1" placeholder="Password" required>
                        <div class="help-block">
                            Passwords don't match.
                        </div>
                    </div>
                </div>
                <div class="form-group has-error">
                    <label for="input_pass2" class="control-label col-sm-2">Repeat Password*</label>
                    <div class="col-xs-4">
                        <input type="password" value="" maxlength="15" class="form-control" name=input_pass2
                               id="input_pass2"  placeholder="Confirm" required>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="form-group">
                    <label for="input_pass1" class="control-label col-sm-2">Password*</label>
                    <div class="col-xs-4">
                        <input type="password" maxlength="15" value="${password}" class="form-control" name=input_pass1
                               id="input_pass1" placeholder="Password" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="input_pass2" class="control-label col-sm-2">Repeat Password*</label>
                    <div class="col-xs-4">
                        <input type="password" maxlength="15" value="${password}" class="form-control" name=input_pass2
                               id="input_pass2" placeholder="Confirm" required>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>
    </form>
</div>


