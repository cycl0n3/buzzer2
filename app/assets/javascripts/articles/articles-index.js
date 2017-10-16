(function ($) {
    var app = angular.module('ArticlesApp', []);

    var ArticlesController = function ($scope, $http) {
        $http.get('/articles.json').then(function (response) {
           if(response.status === 200) {
               $scope.articles = response.data;
           }
        });
    };

    app.controller('ArticlesController', ['$scope', '$http', ArticlesController]);
})(jQuery);
