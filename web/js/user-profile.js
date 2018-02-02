/**
 * Created by Hashan on 12/8/2017.
 */

$(document).ready(runOnLoad());

function getProfileData(userId) {
    alert(userId);
}

function runOnLoad() {
    $.post('PopulateTable',function(responseJson) {
        if(responseJson!=null){
            //console.log("ok");
            var x = 1;
            $.each(responseJson, function(key,value) {
                //console.log("this : " + key);


                $('.timeline').append(
                    '<div class="box border">' +
                    '<div class="box-image"  id="post' + x + '"></div>' +
                    '<div class="box-info">' +
                    '<div class="profile-image" id="propic' + x + '"></div>' +
                    '<div class="box-desc">' +
                    '<div class="profile-name">' + value['name']+'</div>' +
                    '<div class="post-desc">' + value['description']+'</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>'


                );
                // console.log("end : " + value['profileImageUrl']);

                $("#post" + x).css("background-image","url("+  value['url'] +")");
                $("#propic" + x).css("background-image","url("+  value['profileImageUrl'] +")");

                //console.log(x);
                // console.log("end : " + value['url']);
                x++;


            });
        }
    });
}

$(document).on("click",".followbtn",function(){

    $.post('CheckFollow', function (responseJson) {
        //alert("hre");
        if (responseJson == "connected") {
            $.post('UnFollow', function (responseJson) {
                alert("connected");
                if (responseJson != null) {
                    if(responseJson == "success"){
                        //alert("done");
                        $('.followbtn').text("Follow");
                    }else{
                        //alert("not done");
                    }
                }
            });
        }else if(responseJson == "not-connected"){
            alert("not-connected");
            $.post('Follow', function (responseJson) {
                //alert("hre");
                if (responseJson != null) {
                    //alert("hre");
                    if(responseJson == "success"){
                        //alert("done");
                        $('.followbtn').text("Unfollow");
                    }else{
                        //alert("not done");
                    }
                }
            });
        }
    });



});

$(document).on("click",".drop-icon",function(){
    $(".drop-menu").toggle();
});

$(document).on("click",".custom-file-input",function(){
    $(".dp-upload").css("visibility","visible");
});

$(document).on("click",".dp-upload",function(){

    var form = $('#formData')[0];

    var data = new FormData(form);
    //data.append("desc",desc);

    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/UploadProfileImage",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        timeout: 600000,
        success: function (response) {

            alert("Success : " + response)
            window.location.href = "user-profile.jsp";

        },
        error: function (response) {

            alert("Error : " + response)
            window.location.href = "user-profile.jsp";

        }
    });
});

