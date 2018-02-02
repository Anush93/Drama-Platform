/**
 * Created by Hashan on 12/10/2017.
 */
/**
 * Created by Hashan on 12/7/2017.
 */
$(document).ready(runOnLoad1());
$(document).ready(runOnLoad2());

function runOnLoad1() {
    $.post('TutorRequests', function (responseJson) {
        if (responseJson != null) {
            $('.tutorship-notify').text(responseJson);
        }
    });
}
function runOnLoad2() {

    $.post('TutorRequestTable',function(responseJson) {
        if(responseJson!=null){
            //console.log("ok");
            var x = 1;
            $.each(responseJson, function(key,value) {
                //console.log("this : " + key);


                $('.list-of-requests').append(
                    '<tr>'+
                    '<td>'+value['userId']+'</td>'+
                    '<td>'+value['firstName']+'</td>'+
                    '<td>'+value['lastName']+'</td>'+
                    '<td>'+value['type']+'</td>'+
                    '<td>'+value['email']+'</td>'+
                    '<td class="button-set">'+
                    '<div class="ui-group-buttons">'+
                    '<div class="btn btn-success" id="'+ value['userId'] + '" role="button"><p class="glyphicon glyphicon-ok"></p> Allow</div>'+
                    '<div class="or"></div>'+
                    '<div class="btn btn-danger" id="'+ value['userId'] + '" role="button"><p class="glyphicon glyphicon-remove"></p> Block</div>'+
                    '</div>'+
                    '</td>'+
                    '</tr>'

                );

                x++;


            });
        }
    });
}

$(document).ready(function() {
    $('#example').DataTable();
} );

$(document).on("click",".drop-icon",function(){
    $(".drop-menu").toggle();
});

$(document).on("click",".btn-success",function(){
    userId = $(this).attr('id');

    $.post('TutorshipDecision',{"userId" : userId,"type": 1},function(responseJson) {
        if(responseJson!=null){
            $('#'+userId).closest ('tr').fadeOut();
            $(document).ready(runOnLoad1());
            //alert(responseJson);
            //$('.new-notify').text(responseJson);
        }
    });
});

$(document).on("click",".btn-danger",function(){
    userId = $(this).attr('id');

    $.post('TutorshipDecision',{"userId" : userId,"type": 2},function(responseJson) {
        if(responseJson!=null){
            $('#'+userId).closest ('tr').fadeOut();
            $(document).ready(runOnLoad1());
            //alert(responseJson);
            //$('.new-notify').text(responseJson);
        }
    });
});
