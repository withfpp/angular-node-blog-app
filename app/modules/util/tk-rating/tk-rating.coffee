tkRating = -> 
  rating = {
    scope: 
      value: "="
    require: "tkRating"  
    templateUrl: "/modules/util/tk-rating/rating.html"
    controller: "tkRatingCtrl"
    link: (scope, elenemt, attributes, controller) ->
      
      min = parseInt(attributes.min or "1")
      max = parseInt(attributes.max or "5")

      controller.init(min, max)

  }

  return rating

tkRatingCtrl = ($scope) ->
  
  @init = (min, max) =>
    $scope.preview = -1
    $scope.stars = new Array(max - min + 1)

  $scope.click = ($index) =>  
    $scope.value = $index + 1

  $scope.mouseover = ($index) =>
    $scope.preview = $index

  $scope.mouseout = () =>
    $scope.preview = -1
      
  $scope.styles = ($index) =>
    return {
      "fa": true,
      "fa-star": $index < $scope.value,
      "fa-star-o": $index >= $scope.value,
      "starpreview": $index <= $scope.preview
    }  

angular.module('myApp.util')
  .directive('tkRating', tkRating)
  .controller('tkRatingCtrl', tkRatingCtrl)