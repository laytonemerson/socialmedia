<!-- Delete Modal -->
<div id="deleteMovieModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Delete Movie</h4>
            </div>
            <div class="modal-body" style="padding: 10px;">
                <form class="form-horizontal" action="deleteMovie" method="post"  id="delete_form">
                    <input type="HIDDEN" name="poster_path" id="poster_path">
                    <div class="row">
                        <label class="col-md-2 control-label">Poster</label>
                        <div class="col-lg-2 col-md-2 col-sm-2" style="padding-bottom: 10px;" style="padding-top: 10px;">
                            <img src="" name="movie_poster" id="movie_poster">
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-md-2 control-label">ID</label>
                        <div class="col-lg-2 col-md-2 col-sm-2" style="padding-bottom: 10px;" style="padding-top: 10px;">
                            <input id="movie_id" name ="movie_id" class="form-control"  type="text" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-md-2 control-label">Release Date</label>
                        <div class="col-lg-2 col-md-2 col-sm-2" style="padding-bottom: 10px;">
                            <input id="movie_date" name ="movie_date" class="form-control"  type="text" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-md-2 control-label">Title</label>
                        <div class="col-lg-9 col-md-9 col-sm-9" style="padding-bottom: 10px;">
                            <input id="movie_title" name ="movie_title" class="form-control"  type="text" readonly>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-md-2 control-label">Plot</label>
                        <div class="col-lg-9 col-md-9 col-sm-9" style="padding-bottom: 10px;">
                            <textarea style="resize:vertical;" class="form-control" rows="8" name="movie_plot" id="movie_plot" readonly></textarea>
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