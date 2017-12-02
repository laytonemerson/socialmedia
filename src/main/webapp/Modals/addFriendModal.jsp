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
                        <label class="col-md-2 control-label">Movie Count</label>
                        <div class="col-lg-3 col-md-3 col-sm-3" style="padding-bottom: 10px;" style="padding-top: 10px;">
                            <input id="user_count_add" name ="user_count_add" class="form-control"  type="text" readonly>
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