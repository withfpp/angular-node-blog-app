describe('BlogService Spec', function(){

  var mockBlogService, $httpBackend;

  beforeEach(module('myApp'))

  beforeEach(inject(function(_BlogService_ , _$httpBackend_){
    mockBlogService = _BlogService_
    $httpBackend = _$httpBackend_
  }))

  describe('Resource test', function(){

    it('should get posts', inject(function (BlogService){
      $httpBackend
        .expectGET('http://localhost:3000/api/articles')
        .respond([{title: 'new title', text: 'body text'}])

      var result = mockBlogService.query()
      
      $httpBackend.flush()

      expect(result[0].title).toEqual('new title')
      expect(result[0].text).toEqual('body text')  

    }))
  })
})