'use strict';

/* App Module */


var services = angular.module('whydeliverServices', []);
var controllers = angular.module('whydeliverControllers', []);
var app = angular.module('whydeliver', ['ngResource','ngCookies', 'whydeliverServices', 'whydeliverControllers']);

app.config(['$routeProvider', function($routeProvider) {
  $routeProvider.
  		when('/dashboard/', {redirectTo: '/dashboard'}).
      when('/dashboard', {templateUrl: '/assets/templates/dashboard.html.erb',   controller: 'merchantCntl'}).
      when('/delivery', {templateUrl: '/assets/templates/create_delivery.html.erb', controller: 'orderCntl'}).
      when('/tracking/:id', {templateUrl: '/assets/templates/tracking.html.erb', controller: 'orderCntl'}).
      otherwise({redirectTo: 'butter'});
}]);



// angular.module('phonecat', ['phonecatFilters', 'phonecatServices']).
//   config(['$routeProvider', function($routeProvider) {
//   $routeProvider.
//       when('/phones', {templateUrl: 'partials/phone-list.html',   controller: PhoneListCtrl}).
//       when('/phones/:phoneId', {templateUrl: 'partials/phone-detail.html', controller: PhoneDetailCtrl}).
//       otherwise({redirectTo: '/phones'});
// }]);