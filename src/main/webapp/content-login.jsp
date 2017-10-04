<%@include file="taglib.jsp"%>
<div class="container">
    <h2>Login to Social Media</h2>
    <c:choose>
        <c:when test="${newUser == true}">
            <h5>Welcome to social media ${newUserName}. Please log in to start adding friends and inventory.</h5>
        </c:when>
    </c:choose>
    <br>
    <form class="form-horizontal" action="j_security_check" method="post">
        <div class="form-group">
            <label class="control-label col-sm-2" for="j_username">User Name*</label>
            <div class="col-xs-4">
                <input type="text" maxlength="15" class="form-control" name="j_username"
                       id="j_username" placeholder="Enter User Name" required>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="j_password">Password*</label>
            <div class="col-xs-4">
                <input type="password" maxlength="15" class="form-control" name=j_password
                       id="j_password" placeholder="Enter Password" required>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>
    </form>
</div>
