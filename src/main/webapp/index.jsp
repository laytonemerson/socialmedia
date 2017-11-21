<%@include file="taglib.jsp"%>
<c:set var="title" value="Welcome to SM" />
<%@include file="head.jsp"%>
<style>
    body, html {
        height: 100%;
        margin: 0;
        font: 400 15px/1.8 "Lato", sans-serif;
        color: #777;
    }

    .bgimg1, .bgimg2, .bgimg3, .bgimg4, .bgimg5{
        position: relative;
        opacity: 0.85;
        background-attachment: fixed;
        background-position: center;
        background-repeat: no-repeat;
        background-size: cover;

    }

    .bgimg1 {
        background-image: url("Images/bg.jpg");
        min-height: 800px;
    }

    .bgimg2 {
        background-image: url("Images/bg2.jpg");
        min-height: 600px;
    }

    .bgimg3 {
        background-image: url("Images/bg3.jpg");
        min-height: 600px;
    }

    .bgimg4 {
        background-image: url("Images/bg4.jpg");
        min-height: 600px;
    }

    .bgimg5 {
        background-image: url("Images/bg5.jpg");
        min-height: 600px;
    }



    .caption {
        position: absolute;
        left: 0;
        top: 50%;
        width: 100%;
        text-align: center;
        color: #000;
    }

    .caption span.border {
        background-color: #111;
        color: #fff;
        padding: 18px;
        font-size: 25px;
        letter-spacing: 10px;
    }

    h3 {
        letter-spacing: 4px;
        text-transform: uppercase;
        vertical-align: middle;
        font: 20px "Lato", sans-serif;
        color: #111;
    }

    h4 {
        letter-spacing: 3px;
        text-transform: uppercase;
        vertical-align: middle;
        font: 16px "Lato", sans-serif;
        color: #111;
    }

    a { color: inherit; }

    /* Turn off parallax scrolling for tablets and phones */
    @media only screen and (max-device-width: 1024px) {
        .bgimg1, .bgimg2, .bgimg3, .bgimg4, .bgimg5 {
            background-attachment: scroll;
        }
    }
</style>
<html>
<body>
<div id="wrap">
    <c:import url="header.jsp" />
    <c:import url="content-home.jsp" />
</div>
</body>
</html>