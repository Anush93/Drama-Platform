<div class="wrap-left">
    <div class="logo">Drama.lk</div>
    <div class="search-box">
        <input type="text" class="search-text">
        <div class="search-icon"><i class="fa fa-search" style="font-size:20px" aria-hidden="true"></i></div>
    </div>

</div>
<div class="search-result"></div>

<%
    String visibility;
    if(session.getAttribute("user") == null){
        visibility = "hidden";
    }else{
        visibility = "visible";
    }
%>

<div class="button-wrap" style="visibility: <%=visibility%>">
    <div class="nev request-tutorship">
        <div class="advanced-search-icon request-tutorship-icon"></div>
        <div class="advanced-search-text new-text">Request Tutorship</div>
    </div>
    <!--
    <div class="nev  work-upload">
    <div class="advanced-search-icon work-upload-icon"></div>
    <div class="advanced-search-text">Upload Workings</div>
    </div> -->

    <div class="nev  profile">

        <a href="/MyProfile" style="width:100px ">
        <div class="advanced-search-icon profile-icon"></div>

        <div class="advanced-search-text profile-text">Profile</div>
        </a>
        <div class="drop-icon"><i class="fa fa-caret-down" aria-hidden="true" style="background-color: transparent;"></i></div>
    </div>

</div>
<div class="drop-menu">
    <div class="menu-1">Settings</div>
    <div class="menu-2">
        <form action="Logout" method="post">
            <input class="signout" type="submit" value="Logout">
        </form>
    </div>
</div>
