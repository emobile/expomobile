$(function() {
    $('input.datetimeRange').datetimeEntry({
        beforeShow: datetimeRange,
        spinnerImage: '/assets/spinnerUpDown.png',
        spinnerSize: [15, 16, 0],
        spinnerBigSize: [30, 32, 0],
        spinnerIncDecOnly: true,
        datetimeFormat: 'D/O/Y H:Ma'
    });

    function datetimeRange(input) {
        return {minDatetime: (input.id == 'face_to_face_end_date' ?
                    $('#face_to_face_start_date').datetimeEntry('getDatetime') : null),
            maxDatetime: (input.id == 'dtFrom' ?
                    $('#face_to_face_end_date').datetimeEntry('getDatetime') : null)};
    }

    $("#app_id").bind("change keyup", function() {
        if ($(this).val().trim().match(/^[a-zA-Z]\d{3}$/)) {
            $.getJSON(
                    "/attendees/get_attendee",
                    {attendee_id: $(this).val()},
            function(json) {
                if (json) {
                    $("#app_name").val(json.a_name);
                    $("#app_enterprise").val(json.e_name);
                    $("#app_email").val(json.a_email);
                    $("#app_phone").val(json.e_phone);
                    $("#face_to_face_attendee_id").val(json.id);
                }
                else {
                    $("#app_name").val("");
                    $("#app_enterprise").val("");
                    $("#app_email").val("");
                    $("#app_phone").val("");
                    $("#face_to_face_attendee_id").val("");
                }
            });
        }
        else {
            $("#app_name").val("");
            $("#app_enterprise").val("");
            $("#app_email").val("");
            $("#app_phone").val("");
            $("#face_to_face_attendee_id").val("");
        }
    });

    $("#face_to_face_int_name").change(function() {
        $.getJSON(
                "/face_to_faces/get_interviewee",
                {name: $(this).val()},
        function(json) {
            if(json) {
                $("#face_to_face_int_social_reason").val(json.social_reason);
                $("#face_to_face_int_job").val(json.job);
            }
            else {
                $("#face_to_face_int_social_reason").val("");
                $("#face_to_face_int_job").val("");
            }
        });
    });
});