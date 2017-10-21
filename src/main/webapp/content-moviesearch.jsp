<%@include file="taglib.jsp"%>
<c:set var="count" value="0" scope="page" />
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

                <%-- Year --%>

                <div class="form-group">
                    <label class="col-md-2 control-label">Year</label>
                    <div class="col-md-2  inputGroupContainer">
                        <div class="input-group"> <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            <input name="year" placeholder="Optional Year" class="form-control" type="text">
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
                <table class="table table-bordered">
                    <tr>
                        <th>Movie ID</th>
                        <th>Movie Title</th>
                        <th>Release Date</th>
                        <th>Plot</th>
                    </tr>
                    <c:forEach var="current" items="${movies}">
                        <tr>
                            <td>${current.getId()}</td>
                            <td>${current.getTitle()}</td>
                            <td>${current.getReleaseDate()}</td>
                            <td>${current.getOverview()}</td>
                        </tr>
                        <c:set var="count" value="${count + 1}" scope="page"/>
                    </c:forEach>
                </table>
                <c:choose>
                    <c:when test="${count eq 1}">
                        <p>Displaying ${count} result.</p>
                    </c:when>
                    <c:otherwise>
                        <p>Displaying ${count} results.</p>
                    </c:otherwise>
                </c:choose>
            </c:when>
        </c:choose>
    </div>


</div> <!-- End Container -->
<script type="text/javascript" src="validateMovieSearch.js"></script>

