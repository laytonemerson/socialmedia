
<div class="container-fluid">
    <h1>Create a Social Media Account</h1>

    <form action="/addUser" width=300px method="GET">
        <div class="form-group">
            <label for="input_email">Email address: </label>
            <input type="text" class="form-control" id="input_email" placeholder="Email Address">
        </div>
        <div class="form-group">
            <label for="input_first_name">First Name:</label>
            <input type="text" class="form-control" id="input_first_name" placeholder="First Name">
        </div>
        <div class="form-group">
            <label for="input_last_name">Last Name:</label>
            <input type="text" class="form-control" id="input_last_name" placeholder="Last Name">
        </div>
        <div class="form-group">
            <label for="input_phone">Phone Number:</label>
            <input type="text" class="form-control" id="input_phone" placeholder="Phone Number">
            <h6>Used for Account Recovery Purposes Only</h6>
        </div>
        <br>
        <div class="form-group">
            <label for="input_pass1">Password</label>
            <input type="password" class="form-control" id="input_pass1" placeholder="Password">
        </div>
        <div class="form-group">
            <label for="input_pass2">Repeat Password</label>
            <input type="password" class="form-control" id="input_pass2" placeholder="Repeat Password">
        </div>
        <button type="submit" class="btn btn-default">Login</button>
    </form>

</div>