(function ($) {
    var options = {
        init: function () {
            $.LoadingOverlay("show");
        },
        finish: function () {
        },
        progress: function (p) {
        },
        fail: function (data) {
            if(typeof data === "string") {
                data = JSON.parse(data);
            }

            alert(JSON.stringify(data));

            $.LoadingOverlay("hide");
        },
        success: function (data) {
            if(typeof data === "string") {
                data = JSON.parse(data);
            }

            alert(JSON.stringify(data));

            $.LoadingOverlay("hide");
        }
    };

    submitter('edit-article-form', options);
})(jQuery);
