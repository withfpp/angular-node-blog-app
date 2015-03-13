paginate = (arr, currentPage, pageSize) ->
  arr = arr.reverse()
  arr.slice((currentPage-1)*pageSize, currentPage*pageSize)

truncate = (text, length, end) ->
  if isNaN(length)
    length = 300

  end ? "..."

  if text.length <= length or text.length - end.length <= length
    text
  else
    String(text).substring(0, length - end.length) + end
    

angular.module('myApp.util', [ ] )
  .filter('paginate',() -> paginate)
  .filter('truncate', () -> truncate)
