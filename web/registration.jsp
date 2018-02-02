<%--
  Created by IntelliJ IDEA.
  User: anush
  Date: 6/21/2017
  Time: 4:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel = "stylesheet" type="text/css" href="css/registration.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/index-menu.css">
    <link rel="stylesheet" type="text/css" href="css/toggler.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<div class="header">
    <div class="logo" id="logo">Drama.lk</div>


</div>


<div id="msfoarm">
    <div class="bar"
    <ul id="progressbar">
        <li class="active">Account setup</li>
        <li>Personal Profiles</li>
        <li>Profesional Details</li>
    </ul>
    </div>



    <form method="post" action="/Register" name="vform" id="reg">
        <div class="wrap">
            <h2 class="fs-title"> Create your account</h2>
            <h3 class="fs-subtitle">Step 1</h3>
            <div>
            <input id="email" type="email" name="email" placeholder="Email" />
                <div id="email_error" class="val_error"></div>
            </div>
            <div>
            <input id="password" type="password" name="password" placeholder="Password" />
                <div id="password_error" class="val_error"></div>
            </div>
            <div>
            <input id="CPassword" type="password" name="cpassword" placeholder="Confirm Password" />
                <div id="CPassword_error" class="val_error"></div>
            </div>
            <input id="next_1" type="button" name="next_1" class="next_1 action-button" value="Next" />
        </div>
        <div class="wrap">
            <h2 class="fs-title"> Something about you</h2>
            <h3 class="fs-subtitle">Step 2</h3>
            <div>
            <input id="fname" type="text" name="fname" placeholder="First Name" />
                <div id="fname_error" class="val_error"></div>
            </div>
            <div>
            <input id="lname" type="text" name="lname" placeholder="Last name" />
                <div id="lname_error" class="val_error"></div>
            </div>
            <div>
                Birthday
                <input id="birthday" type="date" name="birthday" class = "inputBd" />
                <div id="birthday_error" class="val_error"></div>
            </div>
            <input type="button" name="previouse" class="previous action-button" value="Previous" />
            <input type="button" name="next_2" class="next_2 action-button" value="Next" />
        </div>
        <div class="wrap">
            <h2 class="fs-title"> Who are you?</h2>
            <h3 class="fs-subtitle">Step 3</h3>
            <div>
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
            <div>
                District
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


            <input type="button" name="previouse" class="previous action-button" value="Previous" />
            <input type="submit" name="next_3" class="next_3 action-button" value="Submit" />
        </div>
    </form>



    <script type="text/javascript" src="js/script.js"></script>

</div>
</body>
</html>


