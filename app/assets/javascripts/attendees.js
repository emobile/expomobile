$(function() {
    $("#other_platform").on("change", function() {
        if ($(this).prop("checked")) {
            $("input#attendee_a_platform").css({visibility: "visible"});
        }
        else {
            $("input#attendee_a_platform").css({visibility: "hidden"});
        }
    });

    $("#other_market").on("change", function() {
        if ($(this).prop("checked")) {
            $("input#attendee_a_market_segment").css({visibility: "visible"});
        }
        else {
            $("input#attendee_a_market_segment").css({visibility: "hidden"});
        }
    });

    $.getJSON(
            "attendees/get_all_attendee_names",
            function(data) {
                $("#search_field").autocomplete({
                    source: data,
                    minLength: 2,
                    autoFocus: true,
                    select: function(e, ui) {
                        $(this).val(ui.item.value);
                        $("#search_form").submit();
                    },
                    messages: {}
                });
            }
    );
});