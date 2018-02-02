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
        <div class="welcome-box">
            <h1>Welcome ${user}</h1>
        </div>

    </div>

    <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="js/creative-feed.js"></script>
</body>
</html>
