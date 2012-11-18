'use strict';

/* Controllers */


controllers.controller('myOrdersController', ['$scope', '$cookies', '$routeParams', '$location', 'Merchant', 'Order', 'Orders', function($scope, $cookies, $routeParams, $location, Merchant, Order, Orders){

  $scope.cntlName = 'myOrdersController';
  $scope.params = $routeParams
  $scope.order = Order.get();
  $scope.merchant = Merchant.get();
  $scope.orders = Orders.get({ merch_id : 1});

}]);

controllers.controller('createOrderController', ['$scope', '$cookies', '$routeParams', '$location', 'Order', 'Merchant', function($scope, $cookies, $routeParams, $location, Order, Merchant){

  $scope.name = 'createOrderController';
  $scope.params = $routeParams;
  $scope.orders = Order.get();


  $scope.order = {};

  $scope.update = function(e) {
    e.preventDefault();
    Order.save({order:$scope.order});
    $location.path('/my_orders');
  }
}]);
  
controllers.controller('myAccountController', ['$scope', '$cookies', '$routeParams', '$location', 'Merchant', 'Order', function($scope, $cookies, $routeParams, $location, Merchant, Order){
  $scope.cntlName = 'myAccountController';
  $scope.params = $routeParams;
}]);


  // $scope.trackOrder = function() {
  //   $scope.order = Order.get({
  //     id:$scope.params.id
  //     },
  //     function(data){ //success
  //       $scope.order = data
  //     },
  //     function(data) {
  //       // error handling
  //     }
  //   );
  // }


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

// controllers.controller('TwitterCntl', ['$scope', '$routeParams', '$location', 'Twitter', 'User', function($scope, $routeParams, $location, Twitter, User){
	
//   $scope.name = "TwitterCntl";
//   $scope.params = $routeParams
//   $scope.hash = "#railsrumble"
//   $scope.user = User.get();

//   // $scope.updateHashes = User.post({hash:$scope.hash});

//   $scope.tweets = Twitter.get({
//       search:$scope.params.hash
//       },
//       function(data){ // success
//         $scope.tweets = data
//       },
//       function(data){
//         // error handling goes here
//       }
//     );
//   $scope.mostRecent = User.query('last_viewed');

//   $scope.searchHash = function() {
//     $location.path( "/hash/" + $scope.hash.replace("#",""));
//   };

//   $scope.getHash = function() {
//     $scope.tweets = Twitter.get({search:$scope.params.hash.replace("#","")});
//   };

// }]);

// controllers.controller('UserCntl', ['$scope', '$routeParams', 'User', function($scope, $routeParams, User){
	
//   $scope.user = User.get();
//   $scope.params = $routeParams;
//   $scope.mostRecent = User.query('last_viewed');
//   $scope.search_param = "railsrumble"

//   $scope.getHash = function() {
//     $scope.tweets = Twitter.get({search:$scope.params.hash})
//   };

//   $scope.updateHashes = User.hashes

//   // $scope.updateTweets = function(hash) {
//   //   console.log(hash);
//   //   $scope.search_param = hash;
//   //   browser().navigateTo('#/hash/' + hash);
//   // };

// }]);

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
