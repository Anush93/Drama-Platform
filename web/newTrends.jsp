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
    <link rel="stylesheet" type="text/css" href="css/main.css">
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
        html{
            background: #f5f5f0;
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
    <div class="wrapper">

        <div class = "top-bar clearfix">
            <!--<div class="links">
                <ul>

                    <label for="menu-toggle" class="menu-icon">&#9776;</label>
                    <li><a href="#">New Trends</a></li>

                </ul>
            </div> <!-- links -->
<!--

                <form method="get" action="index.html">
                    <input type="text" placeholder="Search" class="input">
                    <button class="button">&#128269;</button>
                </form>
            </div>
        -->

        </div><!-- top-bar -->
        <!--<div class="navigation"></div>
        <input type = "checkbox" id="menu-toggle">-->


        <div class="main-background"><!-- this is a main background without search bar-->







            <div class="main-bar"><!-- sections and serch bar(call "what new") -->
                <div id="button"><a href="file:///C:/Users/User/Desktop/Member/phots.html">Go To Photos</a></div>
                <div class="slider_wrapper" >
                    <div class="roundabout-example">
                        <ul class="slider">

                            <div class="yur">
                                <h1>RECENT VIDEOS</h1>
                            </div>

                            <li>
                                <video width="400" height="222"  controls>
                                    <source src="resourses/videos/light.mp4" type="video/mp4">
                                </video>
                            </li>
                            <li>
                                <video width="400" height="222" controls>
                                    <source src="resourses/videos/light.mp4" type="video/mp4">
                                </video>
                            </li>
                            <li>
                                <video width="400" height="222" controls>
                                    <source src="resourses/videos/light.mp4" type="video/mp4">
                                </video>
                            </li>
                            <li>
                                <video width="400" height="222" controls>
                                    <source src="resourses/videos/light.mp4" type="video/mp4">
                                </video>
                            </li>
                            <li>
                                <video width="400" height="222" controls>
                                    <source src="resourses/videos/light.mp4" type="video/mp4">
                                </video>
                            </li>
                        </ul>


                    </div>


                </div> <!-- END of slider -->

                <div class="yur">
                    <h1>PAST VIDEOS</h1>
                </div>
                <div class="what-new"><!-- searching section -->
                    <form method="get" action="index.html">
                        <input type="text" placeholder="What's new with you?" class="input">
                        <button class="button">&#128269;</button>
                    </form>
                </div>
                <div class="boxes1">

                    <ul>
                        <li>
                            <video width="220" height="190" controls>
                                <source src="C:\Users\Dell\IdeaProjects\DramaPlatform\web\resourses\video\strangest\st.mp4" type="video/mp4">
                            </video>
                        </li>
                        <li>
                            <video width="220" height="190" controls>
                                <source src="C:\Users\Dell\IdeaProjects\DramaPlatform\web\resourses\video\trangest\nu.mp4" type="video/mp4">
                            </video>
                        </li>
                        <li>
                            <video width="220" height="190" controls>
                                <source src="C:\Users\Dell\IdeaProjects\DramaPlatform\web\resourses\video\strangest\nu.mp4" type="video/mp4">
                            </video>
                        </li>
                        <li>
                            <video width="220" height="190" controls>
                                <source src="C:\Users\Dell\IdeaProjects\DramaPlatform\web\resourses\video\abstract\Das.mp4" type="video/mp4">
                            </video>
                        </li>
                        <li>
                            <video width="220" height="190" controls>
                                <source src="C:\Users\Dell\IdeaProjects\DramaPlatform\web\resourses\video\strangest\nu.mp4" type="video/mp4">
                            </video>
                        </li>
                    </ul>

                </div>
                <div class="boxes2">

                    <ul>
                        <li>
                            <object width="220" height="400"  data="https://www.youtube.com/embed/EI0ib1NErqg"> </object>
                        </li>
                        <li>
                            <object width="220" height="400"  data="https://www.youtube.com/embed/EI0ib1NErqg"> </object>
                        </li>
                        <li>
                            <object width="220" height="400"  data="https://www.youtube.com/embed/EI0ib1NErqg"> </object>
                        </li>
                        <li>
                            <object width="220" height="400"  data="https://www.youtube.com/embed/EI0ib1NErqg"> </object>
                        </li>
                        <li>
                            <object width="480" height="320"  data="https://www.youtube.com/embed/EI0ib1NErqg"> </object>
                        </li>
                    </ul>


                </div>

            </div><!-- play videos,show tutorials -->
        </div>
    </div>

</div>

<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js" ></script>
<script type="text/javascript" src="js/jquery.roundabout.js"></script>
<script type="text/javascript">

    $(document).ready(function() {
        // top example
        $('.roundabout-example ul').roundabout({
            'easing': 'easeOutExpo',
            'duration': 500,
            'btnNext': '.next',
            'btnPrev': '.previous'
        });

        $(window).resize(function() {
            $('.roundabout-example ul').roundabout_animateToBearing($.roundabout_getBearing($('.roundabout-example ul')));
        })
    });

</script>

</body>
</html>

