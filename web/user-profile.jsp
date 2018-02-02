<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%
        if (session.getAttribute("user") == null){
            response.sendRedirect("index.jsp");
        }else{ %>
            <script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
            <script>

                $(document).ready(function() {

                    $.post('GetProfileId', function (responseJson) {
                        if (responseJson != null) {
                            //alert(responseJson);
                            var profileId = responseJson;
                            $.post('GetProfileDetails?profileId=' + profileId, function (responseJson) {
                                if (responseJson != null) {
                                    //console.log(responseJson);

                                    $.each(responseJson, function (key, value) {
                                        //console.log(responseJson);
                                        $('.userpic img').attr('src', value['imageUrl']);
                                        $('.followers').text(value['followers']);
                                        $('.followings').text(value['followings']);
                                        $('.username').text(value['firstName'] + " " + value['lastName']);
                                        $('.profile-details').append(
                                            '<label> Name </label> : ' + value['firstName'] + ' ' + value['lastName'] + '</label><br>' +
                                            '<label> Email </label>  : ' + value['email'] + '</label><br>' +
                                            '<label> Date of Birth </label>  : ' + value['dob'] + '</label>'
                                        );
                                        $('.domain-list').append(
                                            '<li class="list-group-item"><p class="fa fa-male">  ' + value['profession'].toUpperCase() + '</p></li>'
                                        );

                                        //alert(value['followerSet'].length);
                                        var i = 0;
                                        while (i < value['followerSet'].length) {
                                            //alert('GetProfileDetails?profileId=' + value['followerSet'][i]);
                                            $.post('GetProfileDetails?profileId=' + value['followerSet'][i], function (responseJson) {
                                                if (responseJson != null) {
                                                    //console.log(responseJson);
                                                    //alert(responseJson);

                                                    $.each(responseJson, function (key, value) {
                                                        //console.log(responseJson);
                                                        $('.recent-list').append(
                                                            '<div class="memberblock"> <a href="/ChangeProfile?profileId=' + value['userId'] + '" class="member"> <img src="' + value['imageUrl'] + '" alt="">' +
                                                            '<div class="memmbername">' + value['firstName'] + " " + value['lastName'] + '</div></a></div>'
                                                        );
                                                    });
                                                }
                                            });
                                            i++;


                                        }

                                    });
                                }
                            });

                            $.post('CheckFollow', function (responseJson) {
                                if (responseJson != null) {
                                    if (responseJson == "connected") {
                                        $('.followbtn').text("Unfollow");
                                    } else {
                                        $('.followbtn').text("Follow");
                                    }
                                }
                            });

                        }
                    });
                });</script>
        <%}
    %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/toggler.css">

    <link rel="stylesheet" type="text/css" href="css/home-member.css">
    <link rel="stylesheet" type="text/css" href="css/user-profile.css">


    <title>Drama.lk</title>
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

<div class="container">
    <div class="row">
        <div class="col-md-12 text-center ">
            <div class="panel panel-default">
                <div class="userprofile social ">
                    <div class="userpic"> <img  alt="" class="userpicimg"></div>

                    <h3 class="username"></h3>
                    <p>Colombo, Sri Lanka</p>
                    <!--<div class="socials tex-center"> <a href="" class="btn btn-circle btn-primary ">
                        <i class="fa fa-facebook"></i></a> <a href="" class="btn btn-circle btn-danger ">
                        <i class="fa fa-google-plus"></i></a> <a href="" class="btn btn-circle btn-info ">
                        <i class="fa fa-twitter"></i></a> <a href="" class="btn btn-circle btn-warning "><i class="fa fa-envelope"></i></a>
                    </div>-->
                    <form id="formData">
                    <label class="custom-file-input" for="Upload" /> <input id="Upload" type="file" multiple="multiple" name="_photos" accept="image/*" style="visibility: hidden">
                    <button type="button" class="btn btn-default dp-upload" style="visibility: hidden">Upload</button>
                    </form>
                </div>
                <div class="col-md-12 border-top border-bottom">
                    <ul class="nav nav-pills pull-left countlist" role="tablist">
                        <li role="presentation">
                            <h3 class="followers">0</h3>
                            <h2><small>Followers</small> </h2>
                        </li>
                        <li role="presentation">
                            <h3 class="followings">0</h3>
                            <h2><small>Followings</small> </h2>
                        </li>
                        <li role="presentation">
                            <h3 class="posts-count">3</h3>
                            <h2><small>Posts</small> </h2>
                        </li>
                    </ul>
                    <%
                        String visibility;
                        String show;
                        if(session.getAttribute("userId") == session.getAttribute("profileId")){
                            visibility = "hidden";
                            show = "visible";
                        }else{
                            visibility = "visible";
                            show = "hidden";
                        }

                    %>
                    <button class="btn btn-primary followbtn" style="visibility: <%=visibility%>">Follow</button>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <!-- /.col-md-12 -->
        <div class="col-md-4 col-sm-12 pull-right">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1 class="page-header small">Personal Details</h1>
                    <p class="profile-details"></p>
                    <p class="page-subtitle small"></p>
                    <button type="button" class="btn btn-primary" style="visibility: <%=show%>" onClick="location.href='updateProfile.jsp'">Update Profile</button>
                </div>
                <!--<div class="col-md-12 photolist">
                    <div class="row">
                        <div class="col-sm-3 col-xs-3"><img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="" alt=""> </div>
                        <div class="col-sm-3 col-xs-3"><img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="" alt=""> </div>
                        <div class="col-sm-3 col-xs-3"><img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="" alt=""> </div>
                        <div class="col-sm-3 col-xs-3"><img src="https://bootdey.com/img/Content/avatar/avatar1.png" class="" alt=""> </div>
                    </div>
                </div>-->
                <div class="clearfix"></div>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1 class="page-header small">Work Domains</h1>
                    <p class="page-subtitle small">Like to work for different business</p>
                </div>
                <div class="col-md-12">
                    <ul class="list-group domain-list">

                    </ul>
                </div>
                <div class="clearfix"></div>
            </div>
            <!--<div class="panel panel-default">
                <div class="panel-heading">
                    <h1 class="page-header small">Your Recent Posts </h1>
                    <p class="page-subtitle small">Express your self, Express to other</p>
                </div>
                <div class="col-md-12">
                    <div class="media">
                        <div class="media-left"> <a href="javascript:void(0)"> <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="media-object"> </a> </div>
                        <div class="media-body">
                            <h4 class="media-heading">Lucky Sans</h4>
                            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio. </div>
                    </div>
                    <div class="media">
                        <div class="media-left"> <a href="javascript:void(0)">
                            <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="media-object"> </a> </div>
                        <div class="media-body">
                            <h4 class="media-heading">John Doe</h4>
                            Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio. </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>-->
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1 class="page-header small">Recently Connected</h1>
                    <p class="page-subtitle small">You have recently connected with some people</p>
                </div>
                <div class="col-md-12 recent-list">
                    <!--
                    <div class="memberblock"> <a href="" class="member"> <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="">
                        <div class="memmbername">Ajay Sriram</div>
                    </a> <a href="" class="member"> <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                        <div class="memmbername">Rajesh Sriram</div>
                    </a> <a href="" class="member"> <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                        <div class="memmbername">Manish Sriram</div>
                    </a> <a href="" class="member"> <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                        <div class="memmbername">Chandra Amin</div>
                    </a> <a href="" class="member"> <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                        <div class="memmbername">John Sriram</div>
                    </a> <a href="" class="member"> <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="">
                        <div class="memmbername">Lincoln Sriram</div>
                    </a> </div>
                    -->
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="col-md-8 col-sm-12 pull-left posttimeline">


            <div class="panel panel-default timeline">
                <!--<div class="panel-body">
                    <div class="status-upload nopaddingbtm">
                        <form>
                            <textarea class="form-control" placeholder="What are you doing right now?"></textarea>
                            <br>
                            <ul class="nav nav-pills pull-left ">
                                <li><a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Audio"><i class="glyphicon glyphicon-bullhorn"></i></a></li>
                                <li><a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Video"><i class=" glyphicon glyphicon-facetime-video"></i></a></li>
                                <li><a title="" data-toggle="tooltip" data-placement="bottom" data-original-title="Picture"><i class="glyphicon glyphicon-picture"></i></a></li>
                            </ul>
                            <button type="submit" class="btn btn-success pull-right"> Share</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="btn-group pull-right postbtn">
                    <button type="button" class="dotbtn dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> <span class="dots"></span> </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="javascript:void(0)">Hide this</a></li>
                        <li><a href="javascript:void(0)">Report</a></li>
                    </ul>
                </div>
                <div class="col-md-12">
                    <div class="media">
                        <div class="media-left"> <a href="javascript:void(0)"> <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="" class="media-object"> </a> </div>
                        <div class="media-body">
                            <h4 class="media-heading">Lucky Sans<br>
                                <small><i class="fa fa-clock-o"></i> Yesterday, 2:00 am</small> </h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio. </p>

                            <ul class="nav nav-pills pull-left ">
                                <li><a href="" title=""><i class="glyphicon glyphicon-thumbs-up"></i> 2015</a></li>
                                <li><a href="" title=""><i class=" glyphicon glyphicon-comment"></i> 25</a></li>
                                <li><a href="" title=""><i class="glyphicon glyphicon-share-alt"></i> 15</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 commentsblock border-top">
                    <div class="media">
                        <div class="media-left"> <a href="javascript:void(0)"> <img alt="64x64" src="https://bootdey.com/img/Content/avatar/avatar1.png" class="media-object"> </a> </div>
                        <div class="media-body">
                            <h4 class="media-heading">Astha Smith</h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                        </div>
                    </div>
                    <div class="media">
                        <div class="media-left"> <a href="javascript:void(0)"> <img alt="64x64" src="https://bootdey.com/img/Content/avatar/avatar1.png" class="media-object"> </a> </div>
                        <div class="media-body">
                            <h4 class="media-heading">Lucky Sans</h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus. </p>
                            <div class="media">
                                <div class="media-left"> <a href="javascript:void(0)"> <img alt="64x64" src="https://bootdey.com/img/Content/avatar/avatar1.png" class="media-object"> </a> </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Astha Smith</h4>
                                    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="btn-group pull-right postbtn">
                    <button type="button" class="dotbtn dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> <span class="dots"></span> </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="javascript:void(0)">Hide this</a></li>
                        <li><a href="javascript:void(0)">Report</a></li>
                    </ul>
                </div>
                <div class="col-md-12">
                    <div class="media">
                        <div class="media-left"> <a href="javascript:void(0)"> <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="media-object"> </a> </div>
                        <div class="media-body">
                            <h4 class="media-heading"> Lucky Sans<br>
                                <small><i class="fa fa-clock-o"></i> Yesterday, 2:00 am</small> </h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio. </p>
                            <ul class="nav nav-pills pull-left ">
                                <li><a href="" title=""><i class="glyphicon glyphicon-thumbs-up"></i> 2015</a></li>
                                <li><a href="" title=""><i class=" glyphicon glyphicon-comment"></i> 25</a></li>
                                <li><a href="" title=""><i class="glyphicon glyphicon-share-alt"></i> 15</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 border-top">
                    <div class="status-upload">
                        <form>
                            <label>Comment</label>
                            <textarea class="form-control" placeholder="Comment here"></textarea>
                            <br>
                            <ul class="nav nav-pills pull-left ">
                                <li><a title=""><i class="glyphicon glyphicon-bullhorn"></i></a></li>
                                <li><a title=""><i class=" glyphicon glyphicon-facetime-video"></i></a></li>
                                <li><a title=""><i class="glyphicon glyphicon-picture"></i></a></li>
                            </ul>
                            <button type="submit" class="btn btn-success pull-right"> Comment</button>
                        </form>
                    </div>

                </div>
            </div>
            <div class="panel panel-default">
                <div class="btn-group pull-right postbtn">
                    <button type="button" class="dotbtn dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> <span class="dots"></span> </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="javascript:void(0)">Hide this</a></li>
                        <li><a href="javascript:void(0)">Report</a></li>
                    </ul>
                </div>
                <div class="col-md-12">
                    <div class="media">
                        <div class="media-left"> <a href="javascript:void(0)"> <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="media-object"> </a> </div>
                        <div class="media-body">
                            <h4 class="media-heading"> Lucky Sans<br>
                                <small><i class="fa fa-clock-o"></i> Yesterday, 2:00 am</small> </h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio. </p>
                            <ul class="nav nav-pills pull-left ">
                                <li><a href="" title=""><i class="glyphicon glyphicon-thumbs-up"></i> 2015</a></li>
                                <li><a href="" title=""><i class=" glyphicon glyphicon-comment"></i> 25</a></li>
                                <li><a href="" title=""><i class="glyphicon glyphicon-share-alt"></i> 15</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 commentsblock border-top">
                    <div class="media">
                        <div class="media-left"> <a href="javascript:void(0)"> <img alt="64x64" src="https://bootdey.com/img/Content/avatar/avatar1.png" class="media-object"> </a> </div>
                        <div class="media-body">
                            <h4 class="media-heading">Astha Smith</h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus. </p>
                            <div class="media">
                                <div class="media-left"> <a href="javascript:void(0)"> <img alt="64x64" src="https://bootdey.com/img/Content/avatar/avatar1.png" class="media-object"> </a> </div>
                                <div class="media-body">
                                    <h4 class="media-heading">Nested Lucky Sans</h4>
                                    <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="btn-group pull-right postbtn">
                    <button type="button" class="dotbtn dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> <span class="dots"></span> </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="javascript:void(0)">Hide this</a></li>
                        <li><a href="javascript:void(0)">Report</a></li>
                    </ul>
                </div>
                <div class="col-md-12">
                    <div class="media">
                        <div class="media-left"> <a href="javascript:void(0)"> <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="media-object"> </a> </div>
                        <div class="media-body">
                            <h4 class="media-heading"> Lucky Sans<br>
                                <small><i class="fa fa-clock-o"></i> Yesterday, 2:00 am</small> </h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio. </p>
                            <ul class="nav nav-pills pull-left ">
                                <li><a href="" title=""><i class="glyphicon glyphicon-thumbs-up"></i> 2015</a></li>
                                <li><a href="" title=""><i class=" glyphicon glyphicon-comment"></i> 25</a></li>
                                <li><a href="" title=""><i class="glyphicon glyphicon-share-alt"></i> 15</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="panel panel-default">
                <div class="btn-group pull-right postbtn">
                    <button type="button" class="dotbtn dropdown-toggle" data-toggle="dropdown" aria-expanded="false"> <span class="dots"></span> </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="javascript:void(0)">Hide this</a></li>
                        <li><a href="javascript:void(0)">Report</a></li>
                    </ul>
                </div>
                <div class="col-md-12">
                    <div class="media">
                        <div class="media-left"> <a href="javascript:void(0)"> <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="media-object"> </a> </div>
                        <div class="media-body">
                            <h4 class="media-heading"> Lucky Sans<br>
                                <small><i class="fa fa-clock-o"></i> Yesterday, 2:00 am</small> </h4>
                            <p>Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio. </p>
                            <ul class="nav nav-pills pull-left ">
                                <li><a href="" title=""><i class="glyphicon glyphicon-thumbs-up"></i> 2015</a></li>
                                <li><a href="" title=""><i class=" glyphicon glyphicon-comment"></i> 25</a></li>
                                <li><a href="" title=""><i class="glyphicon glyphicon-share-alt"></i> 15</a></li>
                            </ul>
                        </div>
                    </div>
                </div>-->
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/user-profile.js"></script>

</body>
</html>
