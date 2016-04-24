(function() {
  function register() {
    if (navigator.serviceWorker) {
      log('Registering service worker...');
    } else {
      log('No browser support for service worker');
      return;
    }

    return navigator.serviceWorker.register('/serviceworker.js').then(onRegistration);
  }

  function onRegistration(registration) {
    if (!navigator.serviceWorker.controller) {
      log('No controller');
      return;
    }

    if (registration.waiting) {
      log('waiting', registration.waiting);
      return;
    }

    if (registration.installing) {
      log('installing', registration.installing);
      return;
    }

    registration.addEventListener('updatefound', function() {
      log('updatefound', registration.installing);
    });
  }

  function log() {
    console.log("[Main]", ...arguments);
  }

  register();
})();
