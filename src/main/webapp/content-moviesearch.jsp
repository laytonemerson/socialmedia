<%@include file="taglib.jsp"%>
<div class="container-fluid">

    <div class="row">
        <div class="col-md-5 col-md-offset-1">
            <h2>Search for movies with a keyword</h2>
            <br>
        </div>
    </div>

    <div class="row">

        <form class="form-horizontal" action="performSignup" method="post" id="search_form">
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
                            <input name="year" placeholder="Release Year" class="form-control" type="text">
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


</div> <!-- End Container -->
<script type="text/javascript" src="validateMovieSearch.js"></script>
