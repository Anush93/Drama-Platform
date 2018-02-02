<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="css/toggler.css">
    <link rel="stylesheet" type="text/css" href="css/search-page.css">
    <link rel="stylesheet" type="text/css" href="css/search-people.css">




    <title>Search Results</title>
</head>
<body>
<div class="header">
    <div class="wrap-left">
        <div class="logo">Drama.lk</div>
        <div class="search-box">
            <input type="text" class="search-text">
            <div class="search-icon"><i class="fa fa-search" style="font-size:20px" aria-hidden="true"></i></div>
        </div>

    </div>
    <div class="search-result">

    </div>


    <div class="button-wrap">
        <!--
        <div class="nev  work-upload">
        <div class="advanced-search-icon work-upload-icon"></div>
        <div class="advanced-search-text">Upload Workings</div>
        </div> -->
        <div class="nev  profile">
            <div class="advanced-search-icon profile-icon"></div>
            <div class="advanced-search-text profile-text">Profile</div>
            <div class="drop-icon"><i class="fa fa-caret-down" aria-hidden="true"></i></div>
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
</div>
<input type="checkbox" id="menu-toggle" unchecked>
<div class="slide-menu">

    <div class="menu-item">
        <div class="logo-1"></div>
        Learn
    </div>
    <div class="menu-item">
        <div class="logo-2"></div>
        Creative Feed
    </div>
    <div class="menu-item">
        <div class="logo-3"></div>
        News
    </div>
    <div class="menu-item">
        <div class="logo-4"></div>
        Venues
    </div>
    <div class="menu-item">
        <div class="logo-5"></div>
        Rent
    </div>
    <div class="menu-item">
        <div class="logo-6"></div>
        New Trends
    </div>
    <hr class="horizontal">
    <div class="menu-item">
        <div class="logo-7"></div>
        About Us
    </div>

</div>

<label class="menu-label" for="menu-toggle">
    <div class="menu-toggler">
        <span class="line"></span>
    </div>
</label>
<div class="content">
    <div class="filter-results">
        <div class="top-title"><b>Filter Results</b></div>
        <div class="by-district" >
            <div class="sub-title"><strong>BY DISTRICT</strong></div>
            <div class="district-combo">
                <select name="select-district" class="select-district" id="select-district">
                    <option class="district" value="any">Any</option>
                    <option class="district" value="Colombo">Colombo</option>
                    <option class="district" value="Kaluthara">Kaluthara</option>
                    <option class="district" value="Gampaha">Gampaha</option>
                    <option class="district" value="Galle">Galle</option>
                    <option class="district" value="Matara">Matara</option>
                    <option class="district" value="Kandy">Kandy</option>
                    <option class="district" value="Jaffna">Jaffna</option>
                </select>
            </div>
        </div>

        <div class="by-profession" id="by-profession">
            <div class="sub-title"><strong>BY PROFESSION</strong></div>
            <input class="select-profession" type="radio" name="select-profession" value="Director" id="1" checked> <label class="profession" for="1"> Director </label> <br>
            <input class="select-profession" type="radio" name="select-profession" value="Producer" id="2"> <label for="2" class="profession">Producer </label>  <br>
            <input class="select-profession" type="radio" name="select-profession" value="Actor" id="3"> <label for="3" class="profession">Actor </label> <br>
            <input class="select-profession" type="radio" name="select-profession" value="Makeup Artist" id="4"> <label for="4" class="profession">Makeup Artist </label> <br>
            <input class="select-profession" type="radio" name="select-profession" value="Lighting Director" id="5"> <label for="5" class="profession">Lighting Director </label> <br>
            <input class="select-profession" type="radio" name="select-profession" value="Stage Manager" id="6"> <label for="6" class="profession">Stage Manager </label> <br>
            <input class="select-profession" type="radio" name="select-profession" value="Script Writer" id="7"> <label for="7" class="profession">Script Writer </label> <br>
            <input class="select-profession" type="radio" name="select-profession" value="Music Director" id="8"> <label for="8" class="profession">Music Director </label> <br>

        </div>
    </div>
    <div class="result-set">
        <div class="p_bar" id="p_bar">



        </div>

    </div>




<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/search-page.js"></script>
<script type="text/javascript" src="js/home-member.js"></script>


</body>
</html>