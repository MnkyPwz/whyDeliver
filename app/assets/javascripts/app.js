'use strict';

/* App Module */


var services = angular.module('whydeliverServices', []);
var controllers = angular.module('whydeliverControllers', []);
var app = angular.module('whydeliver', ['ngResource', 'whydeliverServices', 'whydeliverControllers']);

app.config(['$routeProvider', function($routeProvider) {
  $routeProvider.
  		when('', {redirectTo: '/dashboard'}).
      when('/dashboard', {templateUrl: '/assets/partials/user-show.html.erb',   controller: 'TwitterCntl'}).
      when('/hash/:hash', {templateUrl: '/assets/partials/hash-detail.html.erb', controller: 'TwitterCntl'}).
      otherwise({redirectTo: 'butter'});
}]);



// angular.module('phonecat', ['phonecatFilters', 'phonecatServices']).
//   config(['$routeProvider', function($routeProvider) {
//   $routeProvider.
//       when('/phones', {templateUrl: 'partials/phone-list.html',   controller: PhoneListCtrl}).
//       when('/phones/:phoneId', {templateUrl: 'partials/phone-detail.html', controller: PhoneDetailCtrl}).
//       otherwise({redirectTo: '/phones'});
// }]);