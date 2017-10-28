<%@include file="taglib.jsp"%>

<script type="text/javascript" class="init">
    $(document).ready( function () {

        $('#userTable').dataTable( {
            "aoColumnDefs": [
                { "bSortable": false, "aTargets": [ 1, 4, 5 ] }
            ],
            "columns": [
                { "width": "11%" },
                { "width": "11%" },
                { "width": "11%" },
                { "width": "11%" },
                { "width": "50%" },
                { "width": "6%" }
            ],
            "aaSorting": [],
            "bPaginate": true,
            "searching": true
        } );

        $('#userTable tbody').on('click', '.btnfriend', function () {

            var user_name = $(this).closest("tr").find("td:eq(0)").text();
            var pic_url = $(this).closest("tr").find("img").attr("src");
            var first_name = $(this).closest("tr").find("td:eq(2)").text();
            var last_name = $(this).closest("tr").find("td:eq(3)").text();
            var bio = $(this).closest("tr").find("td:eq(4)").text();
            var btn = $('#' + user_name);
            var btn_class = btn.attr('class');

            if (btn_class === "btnfriend btn btn-xs btn-danger") {
                var mymodal = $('#deleteFriendModal');
                mymodal.find('.modal-title').text("Would you like to delete " + first_name + " " + last_name + " ?");
                mymodal.find('#user_name_del').val(user_name);
                $('#user_pic_del').attr('src',pic_url);
                mymodal.find('#user_first_del').val(first_name);
                mymodal.find('#user_last_del').val(last_name);
                mymodal.find('#user_bio_del').val(bio);
                mymodal.modal('show');
            } else {
                var mymodal = $('#addFriendModal');
                mymodal.find('.modal-title').text("Would you like to add " + first_name + " " + last_name + " ?");
                mymodal.find('#user_name_add').val(user_name);
                $('#user_pic_add').attr('src',pic_url);
                mymodal.find('#user_first_add').val(first_name);
                mymodal.find('#user_last_add').val(last_name);
                mymodal.find('#user_bio_add').val(bio);
                mymodal.modal('show');
            }

        });

    } );

</script>

<div class="container-fluid">

    <div class="row">
        <div class="col-md-2">
            <h2>Manage my Friends</h2>
            <br>
        </div>
    </div>

    <div class="row">

        <table id="userTable" class="display" cellspacing="0" width="100%">
            <thead>
            <th>User ID</th>
            <th></th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Bio</th>
            <th></th>
            </thead>

            <tbody>
            <c:forEach var="current" items="${friends}">
                <tr>
                    <td>${current.userName}</td>
                    <c:choose>
                        <c:when test="${empty current.userPicture}">
                            <td><img src="Images/noimagesm.png" class="img-responsive"></td>
                        </c:when>
                        <c:otherwise>
                            <td><img src="${current.userPicture}" class="img-responsive"></td>
                        </c:otherwise>
                    </c:choose>
                    <td>${current.firstName}</td>
                    <td>${current.lastName}</td>
                    <td>${current.userBio}</td>
                    <td><button type="button" id="${current.userName}" class="btnfriend btn btn-xs btn-danger"><span class="glyphicon glyphicon-minus"></span></button></td>
                </tr>
            </c:forEach>
            <c:forEach var="current" items="${nonFriends}">
                <tr>
                    <td>${current.userName}</td>
                    <c:choose>
                        <c:when test="${empty current.userPicture}">
                            <td><img src="Images/noimagesm.png" class="img-responsive"></td>
                        </c:when>
                        <c:otherwise>
                            <td><img src="${current.userPicture}" class="img-responsive"></td>
                        </c:otherwise>
                    </c:choose>
                    <td>${current.firstName}</td>
                    <td>${current.lastName}</td>
                    <td>${current.userBio}</td>
                    <td><button type="button" id="${current.userName}" class="btnfriend btn btn-xs btn-success"><span class="glyphicon glyphicon-plus"></span></button></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Delete Friend Modal -->
    <div id="deleteFriendModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Delete Friend</h4>
                </div>
                <div class="modal-body" style="padding: 10px;">
                    <form class="form-horizontal" action="deleteFriend" method="post"  id="delete_form">
                        <div class="row">
                            <label class="col-md-2 control-label">Profile Picture</label>
                            <div class="col-lg-3 col-md-3 col-sm-3" style="padding-bottom: 10px;" style="padding-top: 10px;">
                                <img src="" name="user_pic_del" id="user_pic_del" class="img-responsive">
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-md-2 control-label">User Name</label>
                            <div class="col-lg-7 col-md-7 col-sm-7" style="padding-bottom: 10px;" style="padding-top: 10px;">
                                <input id="user_name_del" name ="user_name_del" class="form-control"  type="text" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-md-2 control-label">First Name</label>
                            <div class="col-lg-7 col-md-7 col-sm-7" style="padding-bottom: 10px;">
                                <input id="user_first_del" name ="user_first_del" class="form-control"  type="text" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-md-2 control-label">Last Name</label>
                            <div class="col-lg-7 col-md-7 col-sm-7" style="padding-bottom: 10px;">
                                <input id="user_last_del" name ="user_last_del" class="form-control"  type="text" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-md-2 control-label">User Bio</label>
                            <div class="col-lg-9 col-md-9 col-sm-9" style="padding-bottom: 10px;">
                                <textarea style="resize:vertical;" class="form-control" rows="8" name="user_bio_del" id="user_bio_del" readonly></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2 col-lg-offset-2 col-md-2 col-md-offset-2 col-sm-2 col-sm-offset-2" style="padding-bottom: 10px;">
                                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                                <button type="submit" class="btn btn-danger" >Yes </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div><!-- modal -->

    <!-- Add Friend Modal -->
    <div id="addFriendModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Friend</h4>
                </div>
                <div class="modal-body" style="padding: 10px;">
                    <form class="form-horizontal" action="addFriend" method="post"  id="add_form">
                        <div class="row">
                            <label class="col-md-2 control-label">Profile Picture</label>
                            <div class="col-lg-3 col-md-3 col-sm-3" style="padding-bottom: 10px;" style="padding-top: 10px;">
                                <img src="" name="user_pic_add" id="user_pic_add" class="img-responsive">
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-md-2 control-label">User Name</label>
                            <div class="col-lg-7 col-md-7 col-sm-7" style="padding-bottom: 10px;" style="padding-top: 10px;">
                                <input id="user_name_add" name ="user_name_add" class="form-control"  type="text" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-md-2 control-label">First Name</label>
                            <div class="col-lg-7 col-md-7 col-sm-7" style="padding-bottom: 10px;">
                                <input id="user_first_add" name ="user_first_add" class="form-control"  type="text" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-md-2 control-label">Last Name</label>
                            <div class="col-lg-7 col-md-7 col-sm-7" style="padding-bottom: 10px;">
                                <input id="user_last_add" name ="user_last_add" class="form-control"  type="text" readonly>
                            </div>
                        </div>
                        <div class="row">
                            <label class="col-md-2 control-label">User Bio</label>
                            <div class="col-lg-9 col-md-9 col-sm-9" style="padding-bottom: 10px;">
                                <textarea style="resize:vertical;" class="form-control" rows="8" name="user_bio_add" id="user_bio_add" readonly></textarea>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-2 col-lg-offset-2 col-md-2 col-md-offset-2 col-sm-2 col-sm-offset-2" style="padding-bottom: 10px;">
                                <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                                <button type="submit" class="btn btn-success" >Yes </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div><!-- modal -->

</div>
