tkRating = -> 
  rating = {
    scope: 
      value: "=",
      id:"="
    require: "tkRating"  
    templateUrl: "/modules/util/tk-rating/rating.html"
    controller: "tkRatingCtrl"
    link: (scope, element, attributes, controller) ->
      
      min = parseInt(attributes.min or "1")
      max = parseInt(attributes.max or "5")
      controller.init(min, max)

  }

  return rating

tkRatingCtrl = ($scope, BlogService) ->
  
  @init = (min, max) =>
    $scope.preview = -1
    $scope.stars = new Array(max - min + 1)

  $scope.click = ($index) =>  
    $scope.value = $index + 1 
    BlogService
      .get({id: $scope.id})
      .$promise
      .then((data)->
        data.rating = $scope.value
        data.$update()
      )
      .catch((err)->
        console.log(err)
      )
   
    
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