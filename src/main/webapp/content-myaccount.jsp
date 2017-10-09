<%@include file="taglib.jsp"%>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 col-md-offset-1">
            <center>
                <h3>Account Management</h3>
                <img src="Images/account.png" class="img-fluid" alt="Friend image">
            </center>
            <ul class="list-group list-group-flush">
                <li class="list-group-item"><strong>User Name: </strong> ${user.userName}</li>
                <li class="list-group-item"><strong>First Name: </strong> ${user.firstName}</li>
                <li class="list-group-item"><strong>Last Name: </strong>  ${user.lastName}</li>
                <li class="list-group-item"><strong>Email Address: </strong> ${user.emailAddress}</li>
                <li class="list-group-item"><strong>Password: </strong>  *******</li>
                <li class="list-group-item">  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Edit account information <span class="glyphicon glyphicon-pencil"></span> </button></li>
            </ul>
        </div>
        <div class="col-md-2 col-md-offset-2">
            <center>
                <h3>Friend Management</h3>
                <img src="Images/friend.png" class="img-fluid" alt="Friend image">
            </center>
        </div>
        <div class="col-md-2 col-md-offset-2">
            <center>
                <h3>Movie Management</h3>
                <img src="Images/movie.png" class="img-fluid" alt="Movie image">
            </center>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Modal Header</h4>
                </div>
                <div class="modal-body">
                    <p>Some text in the modal.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>

</div>



