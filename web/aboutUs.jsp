<%--
  Created by IntelliJ IDEA.
  User: Hashan
  Date: 12/7/2017
  Time: 12:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Creative Feed</title>

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/toggler.css">
    <link rel="stylesheet" type="text/css" href="css/home-member.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        .wrap-left{
            width:100%;
        }
        .signIn{
            height: 20px;
            width: 140px;
            position: relative;
            background-color: #34495e ;
            color: white;
            font-size: 15px;
            font-family: 'Fira Sans', sans-serif,serif;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 7px 10px;
            float: right;
            transform: skewX(-20deg);
            transition: all 0.3s ease-in-out;
        }

        .skew{
            transform: skewX(20deg);
        }

        .signIn:hover {
            cursor: pointer;
            background:#16a085;
        }

        .signIn{
            margin-top: 11px;
            margin-right: 35px;
        }
        #myCarousel .nav a small {
            display:block;
        }
        #myCarousel .nav {
            background-color: #001421;
        }
        #myCarousel .nav a {
            border-radius:0px;
        }

        body{
            background-color: #001421;
        }
    </style>
</head>
<body>
<div class="header">
    <jsp:include page="jspLayouts/visitorHeader.jsp" />
    <a href="index.jsp"><div class="signIn" id="signIn"><p class="skew">Sign In / Register</p></div></a>
</div>

<input type="checkbox" id="menu-toggle" unchecked>
<div class="slide-menu">
    <jsp:include page="jspLayouts/slideMenu.jsp" />
</div>

<label class="menu-label" for="menu-toggle">
    <div class="menu-toggler">
        <span class="line"></span>
    </div>
</label>
<div class="creative-feed">
    <div class="container">
        <div id="home" class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <div id="myCarousel" class="carousel slide text-center" data-ride="carousel" data-interval="3000">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                            <li data-target="#myCarousel" data-slide-to="3"></li>
                            <li data-target="#myCarousel" data-slide-to="4"></li>

                        </ol>
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner" role="listbox">
                            <div class="item active">
                                <img src="resourses/theatre.jpg" alt="4" width="100%" height="100%">

                            </div>
                            <div class="item">
                                <img src="resourses/10.png" alt="2" width="100%" height="100%">
                            </div>
                            <div class="item">
                                <img src="resourses/9r.jpg" alt="3" width="100%" height="100%">
                            </div>
                            <div class="item">
                                <img src="resourses/12r.jpg" alt="1" width="100%" height="100%">
                            </div>
                            <div class="item">
                                <img src="resourses/13r.jpg" alt="5" width="100%" height="100%">
                            </div>

                        </div>

                        <!-- Left and right controls -->
                        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>

                <div class="bg-primary">
                    <!-- <div class="container">
                       <div class="row"> -->
                    <br>
                    <h1 class="text-center text-uppercase">About us</h1>
                    <div class="text-center" style="padding: 20px;">
                        <p align="justify">drama.lk is the Sri lankan First web Based system for Sri lankan theater industry.It leads the way for make
                            connection between islandwide drama artists and new upcoming artists to gain knowladge and meet professoinals.
                            And also gain updates of the worldwide and local theater industry is a main  objective.We are passionate about
                            providing a professional online platform, which benefits all new and professional artists  in the theater  industry.
                            Artists can search our database of Artists to find the perfect match for their productions. Organize your talent
                            and contact professional artists through massage system in the system.
                            Whether you are a new or a professional , create your drama.lk profile and make  your exposure.
                            This is your chance to get to be selected by the producers , for their production by seem your
                            Creations and abilities.
                            The newsfeed and the creativefeed is two main parts for the artists.Through newsfeed artist can
                            pramote their productions and post about drama event , comptetions etc. Creativefeed is the platform
                            for pramote artists workings , creations , and drama related productions . Simply post what he or she
                            talented for.Artists can sroll through the creative feed and watch them .They can like , comment and also report them.
                            Security and trust are things we highly concern with the system.If and one have a dout with any profile or
                            any creations or any thing , simply they can report us.We are aware of providing trust service through the
                            system while escaping fake things.</p>


                    </div>
                    <br>

                    <br>
                    <br>
                    <!--     </div>
                       </div> -->
                </div>
</div>
        </div></div></div>

<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/creative-feed.js"></script>
<script>
    $(document).ready( function() {
        $('#myCarousel').carousel({
            interval:   4000
        });

        var clickEvent = false;
        $('#myCarousel').on('click', '.nav a', function() {
            clickEvent = true;
            $('.nav li').removeClass('active');
            $(this).parent().addClass('active');
        }).on('slid.bs.carousel', function(e) {
            if(!clickEvent) {
                var count = $('.nav').children().length -1;
                var current = $('.nav li.active');
                current.removeClass('active').next().addClass('active');
                var id = parseInt(current.data('slide-to'));
                if(count == id) {
                    $('.nav li').first().addClass('active');
                }
            }
            clickEvent = false;
        });
    });
</script>
</body>
</html>
