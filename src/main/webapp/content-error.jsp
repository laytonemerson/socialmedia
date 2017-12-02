<br>
<br>
<br>
<div class="container-fluid">

    <h1>Whoops!</h1>
    <br>
    <img src="https://i.makeagif.com/media/12-02-2017/PsI3-b.gif" >

    <c:choose>
        <c:when test="${empty ErrorMessage}">
            <h3>${ErrorMessage}</h3>
        </c:when>
        <c:otherwise>
            <h3>An unexpected error has occured.</h3>
        </c:otherwise>
    </c:choose>
    <br>
    <p>For more information, please visit our <a href="https://github.com/laytonemerson/socialmedia">Github Page</a></p>
</div>

