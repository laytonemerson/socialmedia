<%@include file="taglib.jsp"%>
<div class="container">
    <h2>Login to Social Media</h2>
    <br>
    <form class="form-horizontal" action="/action_page.php" method="post">
        <div class="form-group">
            <label class="control-label col-sm-2" for="input_user_name">User Name*</label>
            <div class="col-xs-4">
                <input type="text" maxlength="15" class="form-control" name="input_user_name"
                       id="input_user_name" placeholder="Enter User Name" required>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="input_pass">Password*</label>
            <div class="col-xs-4">
                <input type="password" maxlength="15" class="form-control" name=input_pass
                       id="input_pass" placeholder="Password" required>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>
    </form>
</div>
