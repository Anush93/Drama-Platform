
<%--
  Created by IntelliJ IDEA.
  User: anush
  Date: 9/30/2017
  Time: 4:54 PM
  To change this template use File | Settings | File Templates.
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/toggler.css">

    <link rel="stylesheet" type="text/css" href="css/home-member.css">
    <link rel="stylesheet" type="text/css" href="css/user-profile.css">
    <link rel="stylesheet" type="text/css" href="css/updateProfile.css">


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

<div id = "outer">
    <div id = "description">
        <div class = "discSide">
             </div>
    </div>
    <div id = "regSide">
        <div id="form">
            <br>
            <h3 class="text-center">
                Update my information</h3>
            <form method="post" onsubmit="return validate()" name="vform" action="/UserUpdate" >
                <div>

                    <input class="a" type="text" name="fname" id="fname" placeholder="Enter your First name"
                    />
                    <div id="fname_error" class="val_error"></div>
                </div>
                <div>
                    <input class="a" type="text" name="lname" id="lname" placeholder="Enter your Last Name"
                    />
                    <div id="lname_error" class="val_error"></div>
                </div>
                <div>
                    <input class="a" type="password" name="password" placeholder="Enter your password"
                    />
                </div>
                <div>
                    <input class="a" type="password" name="cpassword" id="Cpassword" placeholder="Confirm your password"
                    />
                    <div id="password_error" class="val_error"></div>
                </div>
                <div>
                    <div class="list">
                        Profession
                        <select name="type">
                            <option value="Actor">Actor</option>
                            <option value="Director">Diretor</option>
                            <option value="Lightning Director">Lightning Director</option>
                            <option value="Makeup Artist">Makeup Artist</option>
                            <option value="Producer">Producer</option>
                            <option value="Stage Manager">Stage Manager</option>
                            <option value="Script Writer">Script Writer</option>
                            <option value="Music Director">Music Director</option>
                            <option value="Other">Other</option>
                        </select>

                    </div>
                    <div class="list">
                        District             .
                        <select name="district">
                            <option value="Colombo">Colombo</option>
                            <option value="Kaluthara">Kaluthara</option>
                            <option value="Gampaha">Gampaha</option>
                            <option value="Galle">Galle</option>
                            <option value="Matara">Matara</option>
                            <option value="Kandy">Kandy</option>
                            <option value="Jaffna">Jaffna</option>

                            <option value="Other">Other</option>
                        </select>

                    </div>

                    <input class="b" type="submit" value="Update"
                    />
                </div>
            </form>
        </div>
    </div>

</div>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="js/updateProfiles.js"></script>
</body>
</html>
