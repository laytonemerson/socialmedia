<%@include file="taglib.jsp"%>

<script type="text/javascript" class="init">

    $.fn.dataTable.ext.search.push(
        function( settings, data, dataIndex ) {
            var e = document.getElementById("friendSelect");
            var strUser = e.options[e.selectedIndex].value;
            var user = data[5];  // use data for the age column;

            if ( strUser === user || strUser === "") {
                return true;
            }
            return false;
        }
    );

    $(document).ready(function() {
        var table = $('#movieTable').DataTable({  "aoColumnDefs": [
            { "bSortable": false, "aTargets": [ 0, 1, 4, 6 ] }
        ],

            "columns": [
                { "width": "5%" },
                { "width": "5%" },
                { "width": "20%" },
                { "width": "12%" },
                { "width": "40%" },
                { "width": "13%" },
                { "width": "5%" }
            ],
            "aaSorting": [],
            "bPaginate": true,
            "order": [[ 2, "asc" ]],
            "searching": true
        } );

        // Event listener to the two range filtering inputs to redraw on input
        $('#friendSelect').click( function() {
            table.draw();
        } );

        $('#movieTable tbody').on('click', '.btnask', function () {
            var id = $(this).closest("tr").find("td:eq(0)").text();
            var title = $(this).closest("tr").find("td:eq(2)").text();
            var to_user = $(this).closest("tr").find("td:eq(5)").text();
            var from_user = '${user.userName}';
            var mymodal = $('#emailFriendModal');
            mymodal.find('.modal-title').text("Send email to " + to_user);
            mymodal.find('#email_subject').val("Can I borrower " + title + "?");
            mymodal.find('#to_user').val(to_user);
            mymodal.find('#movie_id').val(id);
            mymodal.find('#email_body').val('Hello,\n\nI was browsing your movies and really want to borrow ' + title +
                '.\n\nI promise to give it right back :)\n\nCheers!\n' + from_user );
            mymodal.modal('show');
        });
    } );

</script>

<script>
    $(document).on("submit", "#email_form", function(event) {
        var $form = $(this);
        var id = document.getElementById("movie_id").value;
        var to_user = document.getElementById("to_user").value;
        var btnemail = $('#' + to_user + id);
        $('#emailFriendModal').modal('hide');

        $.post($form.attr("action"), $form.serialize(), function(response) {
            btnemail.removeClass("btn-primary").addClass("btn-default");
            btnemail.find('span').toggleClass('glyphicon-envelope').toggleClass('glyphicon-check');
            btnemail.attr('disabled','disabled');
        });

        event.preventDefault(); // Important! Prevents submitting the form.
    });
</script>


 <%--  --%>

<div class="container-fluid">


    <div class="row">
        <div class="col-md-2">
            <h2>My Friends' Movies</h2>
            <br>
        </div>
    </div>

    <div class="row">
        <div class="col-md-2 ">
            <div class="form-group">
                <label for="friendSelect">Only View Movies From:</label>
                <select class="form-control" id="friendSelect">
                    <option value="">All</option>
                    <c:forEach var="currentFriend" items="${friends}">
                        <option>${currentFriend.userName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
    </div>

    <br>

    <div class="row">
        <table id="movieTable" class="display" cellspacing="0" width="100%">
            <thead>
            <th>Movie ID</th>
            <th></th>
            <th>Movie Title</th>
            <th>Release Date</th>
            <th>Plot/Overview</th>
            <th>Movie Owner</th>
            <th></th>
            </thead>
            <tbody>
                <c:forEach var="currentFriend" items="${friends}">
                    <c:forEach var="currentMovie" items="${currentFriend.getUserMovies()}">
                        <tr>
                            <td>${currentMovie.movieId}</td>
                            <c:choose>
                                <c:when test="${empty currentMovie.moviePoster}">
                                    <td><img src="Images/noimagesm.png" ></td>
                                </c:when>
                                <c:otherwise>
                                    <td><img src="https://image.tmdb.org/t/p/w92${currentMovie.moviePoster}"></td>
                                </c:otherwise>
                            </c:choose>
                            <td>${currentMovie.movieTitle}</td>
                            <td>${currentMovie.movieDate}</td>
                            <td>${currentMovie.moviePlot}</td>
                            <td>${currentFriend.userName}</td>
                            <td><button type="button" id="${currentFriend.userName}${currentMovie.movieId}" class="btnask btn btn-xs btn-primary"><span class="glyphicon glyphicon-envelope"></span></button></td>
                        </tr>
                    </c:forEach>
                </c:forEach>
            </tbody>
        </table>
    </div>

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
                                <textarea style="resize:vertical;" class="form-control" rows="8" name="email_body" id="email_body" ></textarea>
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

</div>