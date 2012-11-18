'use strict';

/* App Module */


var services = angular.module('whydeliverServices', []);
var controllers = angular.module('whydeliverControllers', []);
var app = angular.module('whydeliver', ['ngResource','ngCookies', 'whydeliverServices', 'whydeliverControllers']);

app.config(['$routeProvider', function($routeProvider) {
  $routeProvider.
  		when('', {redirectTo: '/my_orders'}).
      when('/my_orders', {templateUrl: '/assets/templates/my_orders.html.erb',   controller: 'myOrdersController'}).
      when('/create_order', {templateUrl: '/assets/templates/create_order.html.erb', controller: 'createOrderController'}).
      when('/my_account', {templateUrl: '/assets/templates/my_account.html.erb', controller: 'myAccountController'}).
      when('/tracking/:id', {templateUrl: '/assets/templates/tracking.html.erb', controller: 'trackingController'}).
      otherwise({redirectTo: 'butter'});
}]);



// angular.module('phonecat', ['phonecatFilters', 'phonecatServices']).
//   config(['$routeProvider', function($routeProvider) {
//   $routeProvider.
//       when('/phones', {templateUrl: 'partials/phone-list.html',   controller: PhoneListCtrl}).
//       when('/phones/:phoneId', {templateUrl: 'partials/phone-detail.html', controller: PhoneDetailCtrl}).
//       otherwise({redirectTo: '/phones'});
// }]);
