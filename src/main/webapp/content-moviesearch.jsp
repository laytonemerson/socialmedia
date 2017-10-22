<%@include file="taglib.jsp"%>

<script type="text/javascript" class="init">
    $(document).ready( function () {
        $('#movieTable').dataTable( {
            "columns": [
                { "width": "5%" },
                { "width": "5%" },
                { "width": "15%" },
                { "width": "5%" },
                { "width": "65%" },
                { "width": "5%" }
            ],
            "aoColumnDefs": [
                { "bSortable": false, "aTargets": [ 1, 4, 5 ] }
            ],
            "order": [[ 2, "asc" ]],
            "bPaginate": false,
            "searching": false
        } );

        $(".btnadd").click(function () {
            var name = $(this).closest("tr").find("td:eq(0)").text();
            alert(name);
        });

    } );

</script>


<div class="container-fluid">


    <div class="row">
        <div class="col-md-5 col-md-offset-1">
            <h2>Search for movies with a keyword</h2>
            <br>
        </div>
    </div>

    <div class="row">

        <form class="form-horizontal" action="performMovieSearch" method="post" id="search_form">
            <fieldset>

                <%-- Keyword --%>

                <div class="form-group">
                    <label class="col-md-2 control-label">Keyword*</label>
                    <div class="col-md-5  inputGroupContainer">
                        <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                            <input name="keyword" placeholder="Keyword Text" class="form-control" type="text">
                        </div>
                    </div>
                </div>

                <%-- Button --%>

                <div class="form-group">
                    <label class="col-md-2 control-label"></label>
                    <div class="col-md-5">
                        <button type="submit" class="btn btn-primary" >Search <span class="glyphicon glyphicon-search"></span></button>
                    </div>
                </div>

            </fieldset>
        </form>
    </div>

    <div class="row">

        <c:choose>
            <c:when test="${searchPerformed == true}">
                <h4>Showing results for "${keyword}"</h4>
                <table id="movieTable" class="display" cellspacing="0">
                    <thead>
                        <th>Movie ID</th>
                        <th></th>
                        <th>Movie Title</th>
                        <th>Release Date</th>
                        <th>Plot/Overview</th>
                        <th></th>
                    </thead>

                    <tbody>
                        <c:forEach var="current" items="${movies}">
                            <tr>
                                <td>${current.getId()}</td>
                                <td><img src="https://image.tmdb.org/t/p/w92${current.getPosterPath()}"></td>
                                <td>${current.getTitle()}</td>
                                <td>${current.getReleaseDate()}</td>
                                <td>${current.getOverview()}</td>
                                <td><button type="button" class="btnadd btn btn-xs btn-success"><span class="glyphicon glyphicon-plus"></span></button></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>

            </c:when>
        </c:choose>
    </div>
</div> <!-- End Container -->

<script type="text/javascript" src="validateMovieSearch.js"></script>

