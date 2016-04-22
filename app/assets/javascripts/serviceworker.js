console.log("Hello World - from Service Worker");

var CACHE = 'loop-cache';
var VERSION = '1';
var CACHE_NAME = CACHE + '-' + VERSION;

self.addEventListener('install', function(event) {
  event.waitUntil(
    caches.open(CACHE_NAME)
  ).then(function() {
    console.log("Howdy!");
  })
});
