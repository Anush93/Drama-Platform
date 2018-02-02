<div class="menu-item">
    <div class="logo-1"></div>
    <%
        //System.out.println(session.getAttribute("user"));
        String link;
        if (session.getAttribute("user") == null){
            link = "creative-feed.jsp";
        }else{
            link = "index.jsp";
        }
    %>
    <a href="<%=link%>">Creative Feed</a>
</div>
<div class="menu-item">
    <div class="logo-2"></div>
    <a href="tutorials.jsp">Learn</a>
</div>
<div class="menu-item">
    <div class="logo-3"></div>
    <a href="../newsFeed/test1.html">News</a>
</div>
<div class="menu-item">
    <div class="logo-4"></div>
    <a href="../venue_jsp.jsp">Venues</a>
</div>
<div class="menu-item">
    <div class="logo-5"></div>
    <a href="../rent/index.html">Rent</a>
</div>
<div class="menu-item">
    <div class="logo-6"></div>
    <a href="../newTrends.jsp">New Trends</a>
</div>
<hr class="horizontal">
<div class="menu-item">
    <div class="logo-7"></div>
    <a href="../aboutUs.jsp6 6">About Us</a>
</div>