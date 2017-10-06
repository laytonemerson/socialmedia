<%@include file="taglib.jsp"%>
<div class="container">
    <h2>Create a Social Media Account</h2>
    <br>
    <form id="main" class="form-horizontal" action="performSignup" method="post" >

        <%-- User Name --%>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="user-name">User Name*</label>
            <div class="col-sm-4">
                <input id="user-name" class="form-control" type="text" placeholder="Up to 15 Chars"
                       name="user-name" >
            </div>
            <div class="col-sm-4 messages"></div>
        </div>


        <%-- Email Address --%>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="email-address">Email Address*</label>
            <div class="col-sm-4">
                <input id="email-address" class="form-control" type="email" placeholder="emailaddress@email.com"
                       name="email-address" >
            </div>
            <div class="col-sm-4 messages"></div>
        </div>

        <%-- First Name --%>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="first-name">First Name*</label>
            <div class="col-sm-4">
                <input id="first-name" class="form-control" type="text" placeholder="John"
                       name="first-name" >
            </div>
            <div class="col-sm-4 messages"></div>
        </div>

        <%-- Last Name --%>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="last-name">Last Name*</label>
            <div class="col-sm-4">
                <input id="last-name" class="form-control" type="text" placeholder="Smith"
                       name="last-name" >
            </div>
            <div class="col-sm-4 messages"></div>
        </div>

        <%-- Password --%>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="password">Password*</label>
            <div class="col-sm-4">
                <input id="password" class="form-control" type="password" placeholder="Password"
                       name="password" >
            </div>
            <div class="col-sm-4 messages"></div>
        </div>

        <%-- Confirm Password --%>

        <div class="form-group">
            <label class="col-sm-2 control-label" for="Password-Confirmation">Confirm Password*</label>
            <div class="col-sm-4">
                <input id="Password-Confirmation" class="form-control" type="password"
                       placeholder="Confirm Password" name="Password-Confirmation" >
            </div>
            <div class="col-sm-4 messages"></div>
        </div>

        <%--Submit Button --%>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary">Submit</button>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="validateSignUp.js"></script>
