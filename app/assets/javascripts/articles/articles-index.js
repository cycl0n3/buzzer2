(function ($) {
    var app = angular.module('ArticlesApp', []);

    var ArticlesController = function ($scope, $http) {
        $.LoadingOverlay("show");

        $http.get('/articles.json').then(function (response) {
            if(response.status === 200) {
                $scope.articles = response.data;

                setTimeout(function(){
                    $.LoadingOverlay("hide");
                }, 500);
            }
        });
    };

    app.controller('ArticlesController', ['$scope', '$http', ArticlesController]);

})(jQuery);
