<%--
  Created by IntelliJ IDEA.
  User: Hashan
  Date: 7/29/2017
  Time: 4:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>

    <%
    if (session.getAttribute("user") == null){
        response.sendRedirect("index.jsp");
    }
    %>


    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/toggler.css">
    <link rel="stylesheet" type="text/css" href="css/work-upload-button.css">
    <link rel="stylesheet" type="text/css" href="css/home-member.css">

</head>
<body>
<div class="header">
    <jsp:include page="jspLayouts/defaultHeader.jsp" />
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
<div class="right-section">
    <jsp:include page="jspLayouts/right-section.jsp" />
</div>
<jsp:include page="jspLayouts/upload-work-window.jsp" />
<div class="work-upload-button">
    <div class="upload-notify">Upload a Working</div>
</div>
<!--
<div class="advanced-search-window">
    <div class="top-wrapper">
        <div class="advanced-search-box">
            <input type="text" placeholder="  SEARCH" class="advanced-search-input">
        </div>
        <div class="advanced-search-button">
            <button class="fa fa-search" style="font-size:30px;" aria-hidden="true"></button>
        </div>
    </div>
    <div class="bottom-wrapper">
        <div class="wrap">
            <div class="label-text">Filter From District</div>
            <div class="district-combo">
                <select>
                    <option>Colombo</option>
                    <option value="burger">Kalutara</option>
                    <option value="pizza">Galle</option>
                    <option value="burger">Gampaha</option>
                    <option value="burger">Matara</option>
                    <option value="fries">Rathnapura</option>
                </select>
            </div>
        </div>
        <div class="wrap">
            <div class="label-text">Filter From Profession</div>
            <div class="district-combo proffesion-combo">
                <select>
                    <option>Director</option>
                    <option value="burger">Producer</option>
                    <option value="pizza">Actor</option>
                    <option value="burger">Script Writer</option>
                    <option value="burger">Lighting Director</option>
                    <option value="fries">Makeup Artist</option>
                </select>

            </div>
        </div>
    </div>

</div>

-->

<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/home-member.js"></script>

</body>
</html>