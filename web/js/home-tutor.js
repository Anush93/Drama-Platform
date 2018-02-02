/**
 * Created by Hashan on 12/7/2017.
 */

$(document).ready(runOnLoad());

function runOnLoad() {
    $.post('Submissions',function(responseJson) {
        if(responseJson!=null){
            $('.new-notify').text(responseJson);

        }
    });
}