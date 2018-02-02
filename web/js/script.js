/**
 * Created by Anush on 2/07/2017.
 */


var current_fs, next_fs, previouse_fs;
var left, opacity, scale;

$(document).ready(function () {
$('#reg').keyup( function(e) {
    var keyCode = e.keyCode || e.which;
    if (keyCode === 13) {
        e.preventDefault();
        return false;
    }
});
});
$(document).ready(function () {
    $('#password').keyup(function(event){
        var email = $("#email").val();
        $("#email_error").text("");
        $("#email").css("border","1px solid #ccc");

        $.ajax({
            type:"post",
            url:"EmailVerify",
            data:{"email":email},
            success:function (data) {
                if (data == email){

                    // email.style.border = "1px solid red";
                    $("#email").css("border","1px solid red");
                    email_error.textContent = "*Check your Email";
                    //$("#email").focus();
                    return false;
                }


            }
        });

    });
});

$(document).ready(function () {
    $('#CPassword').keyup(function(event){
        var password = $("#password").val();
        $("#password_error").text("");
        $("#password").css("border","1px solid #ccc");

        var pass = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$";


        if(pass.test(password) == false){
            // password.style.border = "1px solid red";
            $("#password").css("border","1px solid red");
            password_error.textContent = "*password must contain special character,a capital,and be 7-32 characters long";
            //password.focus();
            // $("#password").focus();
            return false;
        }



    });
});

$(document).ready(function () {
    $('#password').keyup(function(event){
        $("#password_error").text("");
        $("#password").css("border","1px solid #ccc");


    });
});
$(document).ready(function () {
    $('#email').keyup(function(event){
        $("#email_error").text("");
        $("#email").css("border","1px solid #ccc");


    });
});


$(".next_1").click(function(){
    $("#email_error").text("");
    $("#password_error").text("");
    $("#CPassword_error").text("");
    $("#email").css("border","1px solid #ccc");
    $("#password").css("border","1px solid #ccc");
    $("#CPassword").css("border","1px solid #ccc");


    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    var CPassword = document.getElementById("CPassword").value;

    var email_error = document.getElementById("email_error");
    var password_error = document.getElementById("password_error");
    var CPassword_error = document.getElementById("CPassword_error");

    //email.addEventListener("blur",emailVerify, true);
    function emailVerify(){
        if (email.value !=""){
            email.style.border = "1px solid #5E6E66";
            email_error.innerHTML = "";
            return true;
        }
    }
   /* $("#next_1").click(function(){
        var index= $("email");
        $.ajax({
            type:"post",
            url:,
            data:{index:index },
            success:function (data) {

            }
        });

    }); */

    if(email == ""){

       // email.style.border = "1px solid red";
        $("#email").css("border","1px solid red");
        email_error.textContent = "*Email is required";
        //$("#email").focus();
        return false;
    }
    if(email.length >50)
    {
        $("#email").css("border","1px solid red");
        email_error.textContent = "*Don't exceed 50 characters";
        //$("#email").focus();
        return false;

    }
    var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

    if (reg.test(email) == false){

        //email.style.border = "1px solid red";
        $("#email").css("border","1px solid red");
        email_error.textContent = "*Invalid email address";
       // email.focus();
       // $("#email").focus();
        return false;
    }
    if (password ==""){
       // password.style.border = "1px solid red";
        $("#password").css("border","1px solid red");
        password_error.textContent = "*password is required";
       // password.focus();
       // $("#password").focus();
        return false;
    }
     var pass = /^(?=(.*[\W]){1,})(?=(.*?[A-Z]){1,})(?!.*\s).{7,32}$/;


    if(pass.test(password) == false){
       // password.style.border = "1px solid red";
        $("#password").css("border","1px solid red");
        password_error.textContent = "*password must contain special character,a capital,and be 7-32 characters long and don't use space";
        //password.focus();
       // $("#password").focus();
        return false;
    }
    if (password != CPassword){
       // password.style.border = "1px solid red";
        $("#CPassword").css("border","1px solid red");
       // password_confirmation.style.border = "1px solid red";
        CPassword_error.textContent = "*The two passwords do not match";
      //  password.focus();
       // $("#CPassword").focus();
        return false;
    }
    else{
        current_fs =$(this).parent();
        next_fs = $(this).parent().next();
        $("#progressbar li").eq($("#msfoarm .wrap").index(next_fs)).addClass("active");
        next_fs.show();
        current_fs.animate({opacity:0},{
            step:function(now,mx){
                scale = 1-(1-now)*0.2;
                left = (now*50)+"%";
                opacity=1-now;
                current_fs.css({"transform":"scale("+scale+")"});
                next_fs.css({"left":left,"opacity":opacity});

            },
            duration: 800,
            complete:function(){
                current_fs.hide();
            }
        });
    }

//  $("#progressbar").css("background","green");


});

$(".next_2").click(function(){
    $("#fname_error").text("");
    $("#lname_error").text("");
    $("#birthday_error").text("");

    $("#fname").css("border","1px solid #ccc");
    $("#lname").css("border","1px solid #ccc");
    $("#birthday").css("border","1px solid #ccc");

    var fname = document.getElementById("fname").value;
    var lname = document.getElementById("lname").value;
    var bdate = document.getElementById("birthday").value;

    var fname_error = document.getElementById("fname_error");
    var lname_error = document.getElementById("lname_error");
    var birthday_error = document.getElementById("birthday_error");
    if(fname == ""){
       // alert("fill the form correctly");
        // password.style.border = "1px solid red";
        $("#fname").css("border","1px solid red");
        fname_error.textContent = "*First name is required.";
        // password.focus();
       // $("#fname").focus();
        return false;
    }
    if(fname.length >45)
    {
        $("#fname").css("border","1px solid red");
        fname_error.textContent = "*Don't exceed 45 characters.";
        // password.focus();
        // $("#fname").focus();
        return false;
    }
    if(lname == "") {
       // alert("fill the form correctly");
        // password.style.border = "1px solid red";
        $("#lname").css("border", "1px solid red");
        lname_error.textContent = "*Last name is required.";
        // password.focus();
        // $("#lname").focus();
        return false;
    }

    if(lname.length >45)
    {
        $("#lname").css("border","1px solid red");
        fname_error.textContent = "*Don't exceed 45 characters.";

        return false;
    }

    if(bdate == ""){
       // alert("fill the date ");
        birthday_error.textContent = "*Birthday is required.";
        return false;

    }





    function isFutureDate(bdate){

        n =  new Date();
        y = n.getFullYear();
        y = y*365;
        m = n.getMonth() + 1;
        m= m*30;
        d = n.getDate();
        t = y+m+d;
       // alert(t);


       // alert(bdate);
        bdate = bdate.split("-");
       // alert(bdate);
        g= bdate[0];
        h= bdate[1];
        i=bdate[2];
       // alert(i);
        var j = Number(g);
        j = j*365;
        var k = Number(h);
        k = k*30;
        var l = Number(i);
        T = j+ k+ l ;
      //  alert(T);
       // alert(k);
      //  var today = new Date().getTime(),
           // bdate = bdate.split("/");
      //  alert(today);

       // bdate = new Date(bdate[2], bdate[1] - 1, bdate[0]).getTime();
     //   alert(bdate);
        return t<T ? true : false;
    }
    idate = isFutureDate(bdate);
        if(idate == true){
           // alert("fill the date correctly");
            birthday_error.textContent = "*Please enter correct birthday";
            return false;

    }
    else{
        current_fs =$(this).parent();
        next_fs = $(this).parent().next();
        $("#progressbar li").eq($("#msfoarm .wrap").index(next_fs)).addClass("active");
        next_fs.show();
        current_fs.animate({opacity:0},{
            step:function(now,mx){
                scale = 1-(1-now)*0.2;
                left = (now*50)+"%";
                opacity=1-now;
                current_fs.css({"transform":"scale("+scale+")"});
                next_fs.css({"left":left,"opacity":opacity});

            },
            duration: 800,
            complete:function(){
                current_fs.hide();
            }
        });
    }

//  $("#progressbar").css("background","green");







});


$(".previous").click(function(){
    //console.log("koko");
    current_fs =$(this).parent();
    previous_fs = $(this).parent().prev();
    $("#progressbar li").eq($(".wrap").index(current_fs)).removeClass("active");
    previous_fs.show();
    current_fs.animate({opacity:0},{
        step:function(now,mx){
            scale = 0.8+(1-now)*0.2;
            left = ((1-now)*50)+"%";
            opacity=1-now;
            current_fs.css({"left":left});
            previous_fs.css({"transform":"scale("+scale+")","opacity":opacity});

        },
        duration: 800,
        complete:function(){
            current_fs.hide();
        }
    });















});












