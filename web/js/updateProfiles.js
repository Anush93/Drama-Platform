/**
 * Created by Anush on 12/10/2017.
 */
var fname = document.forms["vform"]["fname"];
var lname = document.forms["vform"]["lname"];
var password = document.forms["vform"]["password"];
var cpassword = document.forms["vform"]["cpassword"];

//getting all error display objects
var fname_error = document.getElementById("fname_error");
var lname_error = document.getElementById("lname_error");
var password_error = document.getElementById("password_error");

//setting all event listeners
fname.addEventListener("blur",nameVerify, true);
lname.addEventListener("blur",nameVerify, true);
password.addEventListener("blur",passwordVerify, true);

//validate function
function validate(){
    if (fname.value ==""){
        fname.style.border = "1px solid red";
        fname_error.textContent = "First name is required";
        fname.focus();
        return false;
    }
    if (lname.value ==""){
        lname.style.border = "1px solid red";
        lname_error.textContent = "Last name is required";
        lname.focus();
        return false;
    }

    if (password.value ==""){
        password.style.border = "1px solid red";
        password_error.textContent = "password is required";
        password.focus();
        return false;
    }
    var pass = /^(?=(.*[\W]){1,})(?=(.*?[A-Z]){1,})(?!.*\s).{7,32}$/;

    if(pass.test(password.value) == false){
        password.style.border = "1px solid red";
        password_error.textContent = "password must contain special character,a capital,and be 7-32 characters long";
        password.focus();
        return false;
    }
    if (password.value != cpassword.value){
        password.style.border = "1px solid red";
        cpassword.style.border = "1px solid red";
        password_error.textContent = "The two passwords do not match";
        password.focus();
        return false;
    }



}

//event handler function
function nameVerify(){
    if (fname.value !=""){
        fname.style.border = "1px solid #5E6E66";
        fname_error.innerHTML = "";
        return true;
    }
    if (lname.value !=""){
        lname.style.border = "1px solid #5E6E66";
        lname_error.innerHTML = "";
    }

    return true;
    }


function passwordVerify(){
    if (password.value !=""){
        password.style.border = "1px solid #5E6E66";
        password_error.innerHTML = "";
        return true;
    }
}
