/**
 * Created by Hashan on 12/7/2017.
 */
$(document).ready(runOnLoad1());
$(document).ready(runOnLoad2());

function runOnLoad1() {
    $.post('Submissions', function (responseJson) {
        if (responseJson != null) {
            $('.new-notify').text(responseJson);
        }
    });
}
function runOnLoad2() {

            $.post('SubmissionsTable',function(responseJson) {
                if(responseJson!=null){
                    //console.log("ok");
                    var x = 1;
            $.each(responseJson, function(key,value) {
                //console.log("this : " + key);


                $('.list-of-submissions').append(
                    '<tr>'+
                    '<td>'+value['userId']+'</td>'+
                    '<td>'+value['firstName']+'</td>'+
                    '<td>'+value['lastName']+'</td>'+
                    '<td>'+value['type']+'</td>'+
                    '<td>'+value['itemId']+'</td>'+
                    '<td>'+value['desc']+'</td>'+
                    '<td class="button-set">'+
                    '<div class="ui-group-buttons">'+
                    '<div class="btn btn-success" id="'+ value['itemId'] + '" role="button"><p class="glyphicon glyphicon-ok"></p> Accept</div>'+
                    '<div class="or"></div>'+
                    '<div class="btn btn-danger" id="'+ value['itemId'] + '" role="button"><p class="glyphicon glyphicon-remove"></p> Reject</div>'+
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
    itemId = $(this).attr('id');

    $.post('SubmissionDecision',{"itemId" : itemId,"type": 1},function(responseJson) {
        if(responseJson!=null){
            $('#'+itemId).closest ('tr').fadeOut();
            $(document).ready(runOnLoad1());
            //alert(responseJson);
            //$('.new-notify').text(responseJson);
        }
    });
});

$(document).on("click",".btn-danger",function(){
    itemId = $(this).attr('id');

    $.post('SubmissionDecision',{"itemId" : itemId,"type": 2},function(responseJson) {
        if(responseJson!=null){
            $('#'+itemId).closest ('tr').fadeOut();
            $(document).ready(runOnLoad1());
            //alert(responseJson);
            //$('.new-notify').text(responseJson);
        }
    });
});
