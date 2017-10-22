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
            // console.log(data);

            if(typeof data === "string") {
                data = JSON.parse(data);
            }

            // alert(JSON.stringify(data));

            $.LoadingOverlay("hide");
        },
        success: function (data) {
            // console.log(data);

            if(typeof data === "string") {
                data = JSON.parse(data);
            }

            // alert(JSON.stringify(data));

            if(data.code === "200") {
                alert("Article successfully updated");
            }

            $.LoadingOverlay("hide");
        }
    };

    submitter('edit-article-form', options);
})(jQuery);
