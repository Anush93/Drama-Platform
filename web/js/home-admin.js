/**
 * Created by Hashan on 12/10/2017.
 */
$(document).ready(runOnLoad());

function runOnLoad() {
    $.post('TutorRequests', function (responseJson) {
        if (responseJson != null) {
            $('.tutorship-notify').text(responseJson);
        }
    });
}