describe('Admin - PostListCtrl TEST', function(){
  var $q, $rootScope, $scope, mockBlogService, 
  mockBlogResponse = [
    {
      title: 'title1',
      text: 'text1',
      slug: 'slug1',
      rating: 1
    },
    {
      title: 'title2',
      text: 'text2',
      slug: 'slug2',
      rating: 2
    }
  ];

  beforeEach(module('myApp'));

  beforeEach(inject(function(_$q_, _$rootScope_){
    $q = _$q_;
    $rootScope = _$rootScope_;
  }));

  beforeEach(inject(function($controller){
    $scope = $rootScope.$new();

    mockBlogService = {
      query: function() {
        queryDeferred = $q.defer();
        return {$promise: queryDeferred.promise};
      }
    }

    spyOn(mockBlogService, 'query').and.callThrough();

    $controller('PostListCtrl', {
      '$scope': $scope,
      'BlogService': mockBlogService,
      '$state': {}
    });

  }));


  describe('PostListCtrl -- test', function(){

    beforeEach(function(done){
      queryDeferred.resolve(mockBlogResponse);
      $rootScope.$apply();
      setTimeout(function(){
        done();
      },2000)
    })

    it('should query the BlogService', function(done){
      expect(mockBlogService.query).toHaveBeenCalled();
      done();
    });

    it('should set posts from the service ', function(done){
      expect($scope.posts).toEqual(mockBlogResponse);     
      done();
    });

    it('should set loading status to false after loading finished', function(done){
      expect($scope.loading).toEqual(false);
      done();
    })
    
  });

});
