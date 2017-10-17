(function ($) {
    var app = angular.module('ArticlesApp', []);

    var ArticlesController = function ($scope, $http) {
        $.LoadingOverlay("show");

        $http.get('/articles.json').then(function (response) {
            if(response.status === 200) {
                $scope.articles = response.data;
            }
        });

        $scope.$on('ngRepeatFinished', function(ngRepeatFinishedEvent) {
            $.LoadingOverlay("hide");
        });
    };

    app.controller('ArticlesController', ['$scope', '$http', ArticlesController]);

    app.directive('onFinishRender', function ($timeout) {
        return {
            restrict: 'A',
            link: function (scope, element, attr) {
                if (scope.$last === true) {
                    $timeout(function () {
                        scope.$emit(attr.onFinishRender);
                    });
                }
            }
        }
    });

})(jQuery);
