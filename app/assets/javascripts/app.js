'use strict';

/* App Module */


var services = angular.module('whydeliverServices', []);
var controllers = angular.module('whydeliverControllers', []);
var app = angular.module('whydeliver', ['ngResource', 'whydeliverServices', 'whydeliverControllers']);

app.config(['$routeProvider', function($routeProvider) {
  $routeProvider.
  		when('', {redirectTo: '/'}).
      when('/', {templateUrl: '/assets/templates/profile.html.erb',   controller: 'merchantCntl'}).
      when('/delivery', {templateUrl: '/assets/templates/create_deliver.html.erb', controller: 'deliveryCntl'}).
      when('/tracking', {templateUrl: '/assets/templates/tracking.html.erb', controller: 'merchantCntl'}).
      otherwise({redirectTo: 'butter'});
}]);



// angular.module('phonecat', ['phonecatFilters', 'phonecatServices']).
//   config(['$routeProvider', function($routeProvider) {
//   $routeProvider.
//       when('/phones', {templateUrl: 'partials/phone-list.html',   controller: PhoneListCtrl}).
//       when('/phones/:phoneId', {templateUrl: 'partials/phone-detail.html', controller: PhoneDetailCtrl}).
//       otherwise({redirectTo: '/phones'});
// }]);