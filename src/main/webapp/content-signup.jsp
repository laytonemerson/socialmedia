
<div class="container">
    <h1>Create a Social Media Account</h1>
    <br>
    <form class="form-horizontal" action="/performSignup" method="GET">
        <div class="form-group row">
            <label for="input_user_name" class="control-label col-sm-2" >User Name</label>
            <div class="col-xs-4">
                <input type="text" maxlength="15" class="form-control" id="input_user_name" placeholder="Up to 15 Chars">
            </div>
        </div>
        <div class="form-group row">
            <label for="input_email" class="control-label col-sm-2">Email Address</label>
            <div class="col-xs-4">
                <input type="email" maxlength="60" class="form-control" id="input_email" placeholder="emailaddress@email.com">
            </div>
        </div>
        <div class="form-group row">
            <label for="input_first_name" class="control-label col-sm-2">First Name</label>
            <div class="col-xs-4">
                <input type="text" maxlength="15" class="form-control" id="input_first_name" placeholder="John">
            </div>
        </div>
        <div class="form-group row">
            <label for="input_last_name" class="control-label col-sm-2">Last Name</label>
            <div class="col-xs-4">
                <input type="text" maxlength="20" class="form-control" id="input_last_name" placeholder="Smith">
            </div>
        </div>
        <br>
        <div class="form-group row">
            <label for="input_pass1" class="control-label col-sm-2">Password</label>
            <div class="col-xs-4">
                <input type="password" maxlength="15" class="form-control" id="input_pass1" placeholder="Password">
            </div>
        </div>
        <div class="form-group row">
            <label for="input_pass2" class="control-label col-sm-2">Repeat Password</label>
            <div class="col-xs-4">
                <input type="password" maxlength="15" class="form-control" id="input_pass2" placeholder="Repeat Password">
            </div>
        </div>
        <br>
        <button type="submit" class="btn btn-default">Sign Up</button>
    </form>
</div>
