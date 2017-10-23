$(document).ready(function () {
    var req = new Request({
        url: '/articles.js',
        method: 'GET',
        onRequest: function() {
            $.LoadingOverlay("show");
        },
        onSuccess: function (/*responseText, responseXML*/) {
            $.LoadingOverlay("hide");
        },
        onFailure: function (xhr) {
            alert('Error: ' + JSON.stringify(xhr));
            $.LoadingOverlay("hide");
        }
    });

    req.send();
});

function showArticle(articleId) {
    var req = new Request({
        url: '/articles/'+articleId+'.js',
        method: 'GET',
        onRequest: function() {
            $.LoadingOverlay("show");
        },
        onSuccess: function (/*responseText, responseXML*/) {
            $.LoadingOverlay("hide");
        },
        onFailure: function (xhr) {
            alert('Error: ' + JSON.stringify(xhr));
            $.LoadingOverlay("hide");
        }
    });

    req.send();
}
