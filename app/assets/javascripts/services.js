'use strict';


/* Services */

services.factory('Merchant',['$resource', function($resource){
  return $resource('/api/get_merchant.json', {}, {
  	'get':    {method:'GET'},
    'save':   {method:'POST'},
    'query':  {method:'GET', isArray:true},
    'remove': {method:'DELETE'},
    'delete': {method:'DELETE'}
  });
}]);

services.factory('Order',['$resource', function($resource){
  return $resource('/api/get_order.json', {}, {
  	'get':    {method:'GET'},
	  'save':   {method:'POST'},
	  'query':  {method:'GET', isArray:true},
	  'remove': {method:'DELETE'},
	  'delete': {method:'DELETE'}
  });
}]);