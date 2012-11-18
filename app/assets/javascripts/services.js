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
  return $resource('/api/:action', {action:'order.json'}, {
  	'get':    {method:'GET'},
	  'save':   {method:'POST'},
	  'query':  {method:'GET', isArray:true},
	  'remove': {method:'DELETE'},
	  'delete': {method:'DELETE'}
  });
}]);

services.factory('Orders', ['$resource', function($resource, merch_id){
  return $resource('/api/orders/:merch_id', {}, {
      'get':    {method:'GET', isArray:true}
  });
}]);

