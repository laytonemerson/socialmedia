<!-- Email Friend Modal -->
<div id="emailFriendModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Send Email</h4>
            </div>
            <div class="modal-body" style="padding: 10px;">
                <form class="form-horizontal" action="sendEmail" method="post"  id="email_form">
                    <input type="HIDDEN" name="to_user" id="to_user">
                    <input type="HIDDEN" name="movie_id" id="movie_id">
                    <div class="row">
                        <label class="col-md-2 control-label">Subject</label>
                        <div class="col-lg-9 col-md-9 col-sm-9" style="padding-bottom: 10px;" style="padding-top: 10px;">
                            <input id="email_subject" name ="email_subject" class="form-control"  type="text" >
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-md-2 control-label">Body</label>
                        <div class="col-lg-9 col-md-9 col-sm-9" style="padding-bottom: 10px;">
                            <textarea style="resize:vertical;" class="form-control" rows="10" name="email_body" id="email_body" ></textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-lg-offset-2 col-md-6 col-md-offset-2 col-sm-6 col-sm-offset-2" style="padding-bottom: 10px;">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary" >Send <span class="glyphicon glyphicon-send"></span></button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div><!-- modal -->