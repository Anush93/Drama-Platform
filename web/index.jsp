<%--
  Created by IntelliJ IDEA.
  User: Hashan
  Date: 6/12/2017
  Time: 2:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
  <%
    if (session.getAttribute("type") != null){
      if (session.getAttribute("type").toString().equalsIgnoreCase("member")){
        response.sendRedirect("home-member.jsp");
      }else if(session.getAttribute("type").toString().equalsIgnoreCase("tutor")){
        response.sendRedirect("home-tutor.jsp");
      }else if(session.getAttribute("type").toString().equalsIgnoreCase("admin")){
        response.sendRedirect("home-admin.jsp");
      }
    }

  %>

  <link rel="stylesheet" type="text/css" href="css/index.css">
  <link rel="stylesheet" type="text/css" href="css/index-menu.css">
  <link rel="stylesheet" type="text/css" href="css/toggler.css">

</head>
<body>

<div class="pageWrap">

  <div class="pageContent" id="pageContent">
    <div class="header">
      <div class="logo" id="logo">Drama.lk</div>
      <div class="signIn" id="signIn"><p class="skew">Sign In</p></div>

    </div>
    <input type="checkbox" id="menu-toggle" unchecked>
    <div class="content">
      <label class="menu-label" for="menu-toggle">
        <div class="menu-toggler">
          <span></span>
        </div>
      </label>
      <div class="content-wall">
        <div class="content-left">
          <div class="strip">
            <section class="quote">
              <p >Let yourself live between</p>
              <p> Reality and </p>
              <p> Theater... </p>
            </section>
            <section class="welcome-text">
              <p >Welcome to the Latest Drama Experience. </p>
            </section>
            <a href="registration.jsp" style="text-decoration: none">
            <div class="signUp" id="signUp" >Sign Up </div>
            </a>
          </div>
        </div>
        <div class="content-right"></div>
      </div>

      <div class="container" >
        <div class="row_1">
          <a href="tutorials.jsp">
          <div class="section_1">
            <div class="image-bg"></div>
            <div class="text">Tutorials</div>
          </div>
          </a>
          <a href="creative-feed.jsp">
          <div class="section_2">
            <div class="image-bg"></div>
            <div class="text" style="z-index: 9999;">Creative Feed</div>
          </div>
          </a>
          <a href="newTrends.jsp">
          <div class="section_3">
            <div class="image-bg"></div>
            <div class="text">New Trends</div>
          </div>
          </a>
        </div>
        <div class="row_2">
          <div class="bigCircle">
          </div>
        </div>
        <div class="row_3">
          <a href="newsFeed/test1.html">
          <div class="section_7">
            <div class="image-bg"></div>
            <div class="text">News Feed</div>
          </div>
          </a>
          <a href="venue_jsp.jsp">
          <div class="section_8">
            <div class="image-bg"></div>
            <div class="text">Venue</div>
          </div>
          </a>
          <a href="aboutUs.jsp">
          <div class="section_9">
            <div class="image-bg"></div>
            <div class="text">About Us</div>
          </div>
          </a>
        </div>
      </div>
    </div>
  </div>
  <div id="loginSection" class="loginSection">
    <div class="toggleWrapper">
      <div class="closeButton" id="closeButton">✕</div>
    </div>
    <div class="loginWrapper">
      <div class="headerWrapper">
        <div class="imageTag">
          <div class="image"></div>
        </div>
        <div class="title">Welcome Back !</div>
      </div>
      <form method="get" id="loginForm">
        <div class="loginDetail">
          <div class="username-wrap">
            <div class="username">
              <input type="text" class="usernameInput" id="username" name="username" placeholder="Your email">
            </div>
            <div class="username-notify" id="username-notify"><p class="text-invalid">Invalid Username</p></div>
          </div>
          <div class="password-wrap">
            <div class="password">
              <input type="password" class="passwordInput" id="password" name="password" placeholder="Your password">
            </div>
            <div class="password-notify" id="password-notify"><p class="text-invalid"> Invalid Password </p></div>
          </div>

          <input type="button" class="loginButton" id="loginButton" value="LOGIN">
        </div>
      </form>
    </div>
  </div>
</div>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.3/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>

</body>
</html>

