'use strict';

/* Controllers */


controllers.controller('orderCntl', ['$scope', '$routeParams', '$location', 'Order', 'Merchant', function($scope, $routeParams, $location, Order, Merchant){

  $scope.name = 'orderCntl';
  $scope.params = $routeParams
  $scope.order = Order.get();

  $scope.getOrder = function() {
    $scope.order = Order.get({
      search:$scope.params.tracking
      },
      function(data){ //success
        $scope.order = data
      },
      function(data) {
        // error handling
      }
    );


  };

}]);

controllers.controller('merchantCntl', ['$scope', '$routeParams', '$location', 'Merchant', 'Order', function($scope, $routeParams, $location, Merchant, Order){

  $scope.cntlName = 'merchantCntl';
  $scope.params = $routeParams
  $scope.merchant = Merchant.get();

  $scope.createOrder = function() {
    $scope.order = 
    Order.save(

    );
  };

}]);

// var TweetListCtrl = ['$scope', '$http', function($scope, $http){
// 	$http.get('tweets.json').success(function(data) {
//   $scope.tweets = data.statuses;
//   $scope.orderProp = 'age';
// 	}
// }];

// controllers.controller ('MainCntl', ['$scope', '$route', '$routeParams', '$location', function($scope, $route, $routeParams, $location){

//   $scope.$route = $route;
//   $scope.$location = $location;
//   $scope.$routeParams = $routeParams;

// }]);

controllers.controller('TwitterCntl', ['$scope', '$routeParams', '$location', 'Twitter', 'User', function($scope, $routeParams, $location, Twitter, User){
	
  $scope.name = "TwitterCntl";
  $scope.params = $routeParams
  $scope.hash = "#railsrumble"
  $scope.user = User.get();

  // $scope.updateHashes = User.post({hash:$scope.hash});

  $scope.tweets = Twitter.get({
      search:$scope.params.hash
      },
      function(data){ // success
        $scope.tweets = data
      },
      function(data){
        // error handling goes here
      }
    );
  $scope.mostRecent = User.query('last_viewed');

  $scope.searchHash = function() {
    $location.path( "/hash/" + $scope.hash.replace("#",""));
  };

  $scope.getHash = function() {
    $scope.tweets = Twitter.get({search:$scope.params.hash.replace("#","")});
  };

}]);

controllers.controller('UserCntl', ['$scope', '$routeParams', 'User', function($scope, $routeParams, User){
	
  $scope.user = User.get();
  $scope.params = $routeParams;
  $scope.mostRecent = User.query('last_viewed');
  $scope.search_param = "railsrumble"

  $scope.getHash = function() {
    $scope.tweets = Twitter.get({search:$scope.params.hash})
  };

  $scope.updateHashes = User.hashes

  // $scope.updateTweets = function(hash) {
  //   console.log(hash);
  //   $scope.search_param = hash;
  //   browser().navigateTo('#/hash/' + hash);
  // };

}]);

  // // Hashtag Submit Form
  // $scope.hashtaglist = [];
  // $scope.hash = '';
  //   $scope.submit = function() {
  //   if (this.hash) {
  //     this.hashtaglist.push(this.hash);
  //     this.hash = '';
  //   }
  // };

// controllers.controller('UserCtrl', ['$scope', 'User', function($scope, User){

// 	$scope.user = User.get();
// 	$scope.mostRecent = 'date:"EEE MMM d h:mm:ss Z yyyy"';

// }]);



//PhoneListCtrl.$inject = ['$scope', 'Phone'];



// function TweetDetailCtrl($scope, $routeParams, Phone) {
//   $scope.phone = Phone.get({phoneId: $routeParams.phoneId}, function(phone) {
//     $scope.mainImageUrl = phone.images[0];
//   });

//   $scope.setImage = function(imageUrl) {
//     $scope.mainImageUrl = imageUrl;
//   }
// }

//PhoneDetailCtrl.$inject = ['$scope', '$routeParams', 'Phone'];
