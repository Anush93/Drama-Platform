$(document).ready(runOnLoad());

$(document).on("click",".drop-icon",function(){
    $(".drop-menu").toggle();
});

for(var i = 0 ; i < 2 ; i++){
   /* $(".comments-list").append(
        '<div class="comment-wrapper">'+
        '<div class="comment-user-image"></div>'+
        '<div class="comment-user-desc">'+
        '<div class="comment-username">Ervin Arnold</div>'+
        '<div class="comment">'+
        'The following figure represents a histogram for the above weight data. Notice that if a statistical'+
        'package is used to draw a histogram, it automatically decides the width of the classes, but some of'+
        'them have options to change the widths as needed by the user'+
        '</div>'+
        '</div>'+
        '</div>'
    );
/*
    $(".list-container").append(
        '<div class="item">'+
        '<div class="thumbnail"></div>'+
        '<div class="desc">'+
        'This is the First in the playlist <br><br>'+
        '<small>By</small> <strong>Luis Carter</strong><br>'+
        '<small>2311 views</small>'+
        '</div>'+
        '</div>'
    );*/
}

function runOnLoad() {
    $.post('RecommendedTable', function (responseJson) {
        if (responseJson != null) {
            //console.log("ok");

            $.each(responseJson, function (key, value) {
                //console.log("this : " + key);

                var x = value['id'];

                $('.list-container').append(
                    '<a href="TutorialPlay?id=' + x + '&url=' + value['url'] +'&description='+value['description']+'&name='+value['name']+'&proUrl='+value['proUrl']+'">'+
                    '<div class="item">'+
                    '<div class="thumbnail" style="background-image: url('+value['thumbnail']+');"></div>'+
                    '<div class="desc">'+ value['description']+'<br><br>'+
                    '<small>By</small> <strong>'+ value['name']+'</strong><br>'+
                    '<small>2311 views</small>'+
                    '</div>'+
                    '</div>'+
                    '</a>'
                );

                $("." + x).css("background-image", "url(" + value['thumbnail'] + ")");

            });
        }
    });
    //var idd = '<%= session.getAttribute("id") %>';
    //alert(idd);
    /*
   $.post('CommentList',{"id":idd}, function (responseJson) {
        if (responseJson != null) {
            //console.log("ok");
            alert(responseJson);

            $.each(responseJson, function (key, value) {
                //console.log("this : " + key);

                var x = value['id'];
/*
                $('.list-container').append(
                    '<a href="TutorialPlay?id=' + x + '&url=' + value['url'] +'&description='+value['description']+'&name='+value['name']+'&proUrl='+value['proUrl']+'">'+
                    '<div class="item">'+
                    '<div class="thumbnail" style="background-image: url('+value['thumbnail']+');"></div>'+
                    '<div class="desc">'+ value['description']+'<br><br>'+
                    '<small>By</small> <strong>'+ value['name']+'</strong><br>'+
                    '<small>2311 views</small>'+
                    '</div>'+
                    '</div>'+
                    '</a>'
                );

            });
        }
    });*/


}


