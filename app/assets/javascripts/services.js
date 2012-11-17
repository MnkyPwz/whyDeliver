'use strict';


/* Services */

services.factory('Twitter',['$resource', function($resource){
  return $resource('/api/:action', {action:'get_tweets.json', search:'angularjs'}, {
  	'get': {method:'GET', isArray:true},
    'query': {method:'GET', isArray:true}
  });
}]);

services.factory('User',['$resource', function($resource){
  return $resource('/assets/angular/user_saved_hashtags.json', {}, {
  	'get':    {method:'GET'},
	  'save':   {method:'POST'},
	  'query':  {method:'GET', isArray:true},
	  'remove': {method:'DELETE'},
	  'delete': {method:'DELETE'}
  });
}]);