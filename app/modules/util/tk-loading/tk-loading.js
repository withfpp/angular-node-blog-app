// Generated by CoffeeScript 1.8.0
var tkLoading;

tkLoading = function($http) {
  var obj;
  obj = {
    restrict: 'A',
    link: (function(_this) {
      return function(scope, element, attrs) {
        scope.isLoading = function() {
          return $http.pendingRequests.length > 0;
        };
        return scope.$watch(scope.isLoading, function(v) {
          if (v) {
            return element.show();
          } else {
            return element.hide();
          }
        });
      };
    })(this)
  };
  return obj;
};

angular.module('myApp.util').directive('tkLoading', ['$http', tkLoading]);