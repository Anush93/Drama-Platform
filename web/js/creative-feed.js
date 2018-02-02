/**
 * Created by Hashan on 12/7/2017.
 */
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
}

