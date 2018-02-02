<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="css/toggler.css">
    <link rel="stylesheet" type="text/css" href="css/tutorials.css">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

    <title>Search Results</title>
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
<div class="category-button">Categories </div>
<div class="categories">
    <div class="main-title">Categories</div>
    <div class="category-list-1">
        <ul class="category-list">
            <li>Cross-Cutting</li>
            <li>Forum Theatre</li>
            <li>Hot Seating</li>
            <li>Image Theatre</li>
            <li>Spotlight</li>
            <li>Soundscape</li>
            <li>Still Images</li>
        </ul>
    </div>
    <div class="category-list-2">
        <ul class="category-list">
            <li>Miming</li>
            <li>Thought Tracking</li>
            <li>Tableaux</li>
            <li>Narration</li>
        </ul>
    </div>
</div>
<div class="content">
    <div class="recommended-list">
        <div class="list-title">Recommended</div>
        <ul class="unodered unodered-recommended">
        </ul>
            <!--<div class="arrow"></div>-->

    </div>
    <div class="recent-upload-list">
        <div class="list-title">Recently Uploaded</div>
        <div class="recent-upload-list-items">
            <ul class="unodered unodered-recent">
            </ul>
            <div class="arrow"></div>
        </div>
    </div>
    <div class="recent-upload-list">
        <div class="list-title">Miming</div>
        <div class="recent-upload-list-items">
            <ul class="unodered unodered-miming">
            </ul>
            <div class="arrow"> </div>
        </div>
    </div>

</div>


<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/tutorials.js"></script>

</body>
</html>