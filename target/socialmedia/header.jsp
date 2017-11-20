<%@include file="taglib.jsp"%>
<div id="header">
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand">Social Media</a>
            </div>
            <ul class="nav navbar-nav">
                <li class="active"><a href="/socialmedia">Home</a></li>
                <li><a href="#">Page 1</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <c:choose>
                    <c:when test="${loggedIn == true}">
                        <li><a href="showMyAccount"><span class="glyphicon glyphicon-user"></span> My Account</a></li>
                        <li><a href="performSignout"><span class="glyphicon glyphicon-log-out"></span> Sign Out</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a href="showSignup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                        <li><a href="showMyAccount"><span class="glyphicon glyphicon-log-in"></span> Sign In</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </nav>
</div>