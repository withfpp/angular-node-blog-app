// Generated by CoffeeScript 1.8.0
var paginate, truncate;

paginate = function(arr, currentPage, pageSize) {
  return arr.slice((currentPage - 1) * pageSize, currentPage * pageSize);
};

truncate = function(text, length, end) {
  if (isNaN(length)) {
    length = 300;
  }
    if (end != null) {
    end;
  } else {
    "...";
  };
  if (text.length <= length || text.length - end.length <= length) {
    return text;
  } else {
    return String(text).substring(0, length - end.length) + end;
  }
};

angular.module('myApp.util', []).filter('paginate', function() {
  return paginate;
}).filter('truncate', function() {
  return truncate;
});
