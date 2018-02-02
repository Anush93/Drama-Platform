/*$(document).ready(function() {



    for (var i = 0; i < 5; i++) {
        $('.right-content').append(
            '<div class="list-item">'+
            '<div class="item-image border"></div>'+
            '<div class="item-desc">Miming Beginner Course</div>'+
            '</div>'
        );
    }
});
*/
$(document).on("click",".drop-icon",function(){
    $(".drop-menu").toggle();
});

$(document).ready(runOnLoad());

function runOnLoad() {
    $.post('PopulateTable',function(responseJson) {
        if(responseJson!=null){
            //console.log("ok");
            var x = 1;
            $.each(responseJson, function(key,value) {
                //console.log("this : " + key);


                $('.creative-feed').append(
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

    $.post('CheckTutorRequest',function(responseJson) {
        if(responseJson!=null){
            if(responseJson == "requested"){
                $('.new-text').text("Requested");
                $('.new-text').css('color','#c0392b');
            }
        }
    });
}

$(document).on("click",".request-tutorship",function() {
    //alert("hihih");
    $.post('RequestTutorship', function (responseJson) {
        //alert("hihihdsd");
        if (responseJson != null) {
            //alert("hihiqqqqh");
            if(responseJson == "requested"){
                $('.new-text').text("Requested");
                $('.new-text').css('color','#c0392b');
            }else if(responseJson == "success"){
                $('.new-text').text("Requested");
                $('.new-text').css('color','#c0392b');
            }else if(responseJson == "failed"){
            }
        }
    });
});

$(document).on("click",".close",function(){
    invisible();
});

$(document).on("click",".work-upload-button",function(){
    //alert("hi");
    if (  $(".upload-work-window").hasClass("upload-work-window-show")) {
        remove_upload_working();
        setTimeout( function(){
            $("body").css("overflow-y","scroll");
        },500);
    }else{

        if($(".advanced-search-window").hasClass("advanced-search-window-show")){
            remove_advanced_search();
        }

        $(".upload-work-window").addClass("upload-work-window-show");
        work_opaque();
    }

});

function remove_upload_working(){
    $(".upload-work-window").removeClass("upload-work-window-show");
    $(".creative-feed , .right-section").css("opacity",1);


    setTimeout( function(){
        $(".upload-work-window").css("z-index","-1");
    },500);
}

function work_opaque(){
    $(".creative-feed , .right-section").css("opacity",0.3);
    $("body").css("overflow-y","hidden");
    $(".upload-work-window").css("z-index","1");
}




$(document).on("click",".advanced-search",function(){
    if (  $(".advanced-search-window").hasClass("advanced-search-window-show")) {
        remove_advanced_search();
        setTimeout( function(){
            $("body").css("overflow-y","scroll");
        },500);
    }else{

        if($(".upload-work-window").hasClass("upload-work-window-show")){
            remove_upload_working();
        }

        $(".advanced-search-window").addClass("advanced-search-window-show");
        search_opeque();
    }

});

function remove_advanced_search(){
    $(".advanced-search-window").removeClass("advanced-search-window-show");
    $(".creative-feed , .right-section").css("opacity",1);
}

function search_opeque(){
    $(".creative-feed , .right-section").css("opacity",0.3);
    $("body").css("overflow-y","hidden");
}


$(document).on("click",".creative-feed , .right-section",function(){
    invisible();
});

function invisible(){
    //console.log("hi");
    $(".upload-work-window").removeClass("upload-work-window-show");
    $(".advanced-search-window").removeClass("advanced-search-window-show");
    $(".creative-feed , .right-section").css("opacity",1);

    setTimeout( function(){
        $("body").css("overflow-y","scroll");
    },500);
    setTimeout( function(){
        $(".upload-work-window").css("z-index","-1");
    },500);

}

$(".search-text").keyup(function(event){
    $(".search-result").css("display","block");
    var text = $(".search-text").val();
    //console.log(text);
    $.post('Search',{name : text},function(responseJson) {
        if(responseJson!=null){
            //console.log("ok");
            var x = 1;
            $(".search-result").empty();
            $.each(responseJson, function(key,value) {

                $(".search-result").append('<div class="result-item" id="result-item-' + x + '">' + value['firstName'] + ' ' + value['lastName'] + '</div>');
                x++;
            });
        }
    });
});

$(document).on("click",".search-icon",function () {
    var searchText = $(".search-text").val();
    searchText = searchText.split(" ");
    fname = searchText[0];
    lname = searchText[1];
    $.ajax({
        type:'post',
        url:'PeopleSearch',
        data:{"fname":fname,"lname":lname},
        success:function(data){
//alert(data);

            window.location.replace("search-page.jsp");
        }
    });

});

$(document).on("click",".search-result",function(e) {
    var text = $(e.target).text();
    $(".search-text").val(text);
    $(".search-result").css("display","none");


});

$(document).on("click",".search-icon",function () {
    var searchText = $(".search-text").val();

});

$(document).on("click",".work-upload-button",function(){
    $(".upload-notify").css("opacity","0");
});
/*
$(document).on("click",".upload-button",function(){
    if($(".text-region").val() == ""){
        //alert("hihi");
    }
});
*/
$(document).on("click", ".upload-button", function() {
    var desc = $('.input-text').val();
    var file = $('#file-browse').val();

    //alert(file);
    //alert(desc);
    //console.log(pass);
    if(desc == "" || file == ""){
        alert("Cannot Be Empty");
        $('.input-text').text("You Should Choose a file and You Should Enter a Description.");
    }else{
        var form = $('#fileUploadForm')[0];

        var data = new FormData(form);
        //data.append("desc",desc);

        $.ajax({
            type: "POST",
            enctype: 'multipart/form-data',
            url: "/FileUpload",
            data: data,
            processData: false,
            contentType: false,
            cache: false,
            timeout: 600000,
            success: function (response) {

                //alert("Success : " + response)
                window.location.href = "home-member.jsp";

            },
            error: function (response) {

                //alert("Error : " + response)
                window.location.href = "home-member.jsp";

            }
        });
    }

    /*
    $.post("FileUpload", {data : data},function(response) {
        if(response){
            window.location.href = "home-member.jsp";
        }
    });*/
});
