

<!-- Delete Modal -->
<div id="deleteAccountModal" class="modal fade" role="dialog">

    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Delete Account</h4>
            </div>
            <div class="modal-body">
                <p>Are you sure you want to delete your account?</p>

                <form class="form-horizontal" action="deleteAccount" method="post"  id="delete_form">

                    <%-- User Name --%>
                    <div class="form-group">
                        <label class="col-md-3 control-label">User Name*</label>
                        <div class="col-md-9  ">
                            <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input name="user_name" placeholder="User Name" class="form-control"  type="text" readonly
                                       value="${user.userName}">
                            </div>
                        </div>
                    </div>

                    <%-- Button --%>
                    <div class="form-group">
                        <label class="col-md-3 control-label"></label>
                        <div class="col-md-5">
                            <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
                            <button type="submit" class="btn btn-danger" >Yes </button>
                        </div>
                    </div>

                </form>
            </div>

            <div class="modal-footer">

            </div>
        </div>
    </div>
</div><!-- modal -->