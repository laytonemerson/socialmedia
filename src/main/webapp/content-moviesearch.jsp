<%@include file="taglib.jsp"%>

<script type="text/javascript" class="init" src="Javascript/movieSearchTable.js"></script>
<script type="text/javascript" src="Javascript/movieSearchSubmit.js"></script>

<div class="container-fluid">
    <br><br><br>
    <div class="row">
        <div class="col-md-5 col-md-offset-1">
            <h2>Search for movies with a keyword</h2>
            <br>
        </div>
    </div>

    <form class="form-horizontal" action="performMovieSearch" method="post" id="search_form">
        <fieldset>

            <%-- Keyword --%>

            <div class="form-group">
                <label class="col-md-2 control-label">Keyword*</label>
                <div class="col-md-5  inputGroupContainer">
                    <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                        <input name="keyword" placeholder="Keyword Text" required class="form-control" type="text">
                    </div>
                </div>
            </div>

            <%-- Button --%>

            <div class="form-group">
                <div class="col-md-1 col-md-offset-2">
                    <button type="submit" class="btn btn-primary" >Search <span class="glyphicon glyphicon-search"></span></button>
                </div>
            </div>

        </fieldset>
    </form>

    <div class="row">

        <c:choose>
            <c:when test="${searchPerformed == true}">
                <br><br>
                <h4>Showing results for "${keyword}"</h4>
                <br>
                <table id="movieTable" class="display" cellspacing="0" width="100%">
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
                                <c:choose>
                                    <c:when test="${empty current.getPosterPath()}">
                                        <td><img src="Images/noimagesm.png" alt=""></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><img src="https://image.tmdb.org/t/p/w92${current.getPosterPath()}" alt="${current.getPosterPath()}"></td>
                                    </c:otherwise>
                                </c:choose>
                                <td>${current.getTitle()}</td>
                                <td>${current.getReleaseDate()}</td>
                                <td>${current.getOverview()}</td>
                                <c:choose>
                                    <c:when test="${current.userHas() == false}">
                                        <td><button type="button" id="${current.getId()}" class="btnadd btn btn-xs btn-success"><span class="glyphicon glyphicon-plus"></span></button></td>
                                    </c:when>
                                    <c:otherwise>
                                        <td><button type="button" id="${current.getId()}" class="btndel btn btn-xs btn-default disabled"><span class="glyphicon glyphicon-check"></span></button></td>
                                    </c:otherwise>
                                </c:choose>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
        </c:choose>
    </div>
    <c:import url="Modals/addMovieModal.jsp" />
</div> <!-- End Container -->