$(document).on("click",".drop-icon",function(){
    $(".drop-menu").toggle();

});


//display search list in search page
$(document).ready(function() {
    $.ajax({
        type:'post',
        url:'GetSearchList',
        //get value from search list
        success:function(data){
           // alert(data);
            if(data!=null){

                var x = 1;
                var res=$.parseJSON(data);
                $.each(res, function(key,value) {
                   // console.log("this : " + key);

                    //add this values to pbar
                    $('.p_bar').append(
                    '<div class="profile">'+
                        '<div class="picture sh-blue"><img src='+  value['profileImageUrl'] + '></div>'+

                        '<div class="description">'+
                        '<p class="name">' + value['name']+'</p>'+
                    '<p class="profession">' + value['profession']+'</p>'+
                    '<a href="/ChangeProfile?profileId=' + value['personId'] + '" class="">'+
                    '<button class="blue border-blue">Profile</button>'+
                    '</a>'+


                        '</div>'+

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
        }
    });
});


$(document).on("click",".by-profession",function () {
    $("#p_bar").empty();
    var searchProfession = $('input[name=select-profession]:checked').val();

    var searchDistrict = $('#select-district').find(":selected").text();


    $.ajax({
        type:'post',
        url:'PeopleAdvanceSearch',
        //get vales of district and profession
        data:{"district":searchDistrict,"profession":searchProfession},
        success:function(data){
            if(data!=null){
                console.log(data);
                // alert("awa1");
                //console.log("ok");
                var x = 1;

                $.each(data, function(key,value) {

                    //add this code to pbar div

                    $('.p_bar').append(
                        '<div class="profile">'+
                        '<div class="picture sh-blue"><img src='+  value['profileImageUrl'] + '></div>'+

                        '<div class="description">'+
                        '<p class="name">' + value['name']+'</p>'+
                        '<p class="profession">' + value['profession']+'</p>'+
                        '<a href="/ChangeProfile?profileId=' + value['personId'] + '" class="">'+
                        '<button class="blue border-blue">Profile</button>'+
                        '</a>'+


                        '</div>'+

                        '</div>'





                    );


                    $("#post" + x).css("background-image","url("+  value['url'] +")");
                    $("#propic" + x).css("background-image","url("+  value['profileImageUrl'] +")");


                    x++;


                });
            }


        }
    });

});