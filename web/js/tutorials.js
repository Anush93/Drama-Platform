$(document).ready(runOnLoad());

$(document).on("click",".drop-icon",function(){
    $(".drop-menu").toggle();
});
/*
$(document).on("click",".item-link",function(){
    window.location.href = "tutorial-player.jsp";
});
*/
$(document).on("click",".category-button",function(){
    if($(".content").hasClass("category-show")){
        $(".content").removeClass("category-show");
        $(this).text("Categories ");
    }else{
        $(".content").addClass("category-show");
        $(this).text("Hide ");
    }
});

function runOnLoad() {
    $.post('RecommendedTable',function(responseJson) {
        if(responseJson!=null){
            //console.log("ok");

            $.each(responseJson, function(key,value) {
                //console.log("this : " + key);

                var x = value['id'];

                $('.unodered-recommended').append(

                    '<li class="unodered-item"><a class="item-link" href="TutorialPlay?id='+x+'&url='+value['url']+'&description='+value['description']+'&name='+value['name']+'"><div class="item '+ x +'"></div></a></li>'

                    /*'<div class="box border">' +
                    '<div class="box-image"  id="post' + x + '"></div>' +
                    '<div class="box-info">' +
                    '<div class="profile-image" id="propic' + x + '"></div>' +
                    '<div class="box-desc">' +
                    '<div class="profile-name">' + value['name']+'</div>' +
                    '<div class="post-desc">' + value['description']+'</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>'*/


                );
                // console.log("end : " + value['profileImageUrl']);

                $("." + x).css("background-image","url("+  value['thumbnail'] +")");

                //console.log(x);
                // console.log("end : " + value['url']);
                //x++;


            });
        }
    });

    $.post('RecentTable',function(responseJson) {
        if(responseJson!=null){
            //console.log("ok");

            $.each(responseJson, function(key,value) {
                //console.log("this : " + key);

                var x = value['id'];

                $('.unodered-recent').append(

                    '<li class="unodered-item"><a class="item-link" href="TutorialPlay?id='+x+'&url='+value['url']+'"><div class="item '+ x +'"></div></a></li>'

                );

                $("." + x).css("background-image","url("+  value['thumbnail'] +")");


            });
        }
    });

    $.post('MimingTable',function(responseJson) {
        if(responseJson!=null){
            //console.log("ok");

            $.each(responseJson, function(key,value) {
                //console.log("this : " + key);

                var x = value['id'];

                $('.unodered-miming').append(

                    '<li class="unodered-item"><a class="item-link" href="TutorialPlay?id='+x+'&url='+value['url']+'"><div class="item '+ x +'"></div></a></li>'

                );

                $("." + x).css("background-image","url("+  value['thumbnail'] +")");


            });
        }
    });
}


