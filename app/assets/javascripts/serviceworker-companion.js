(function() {
  function register() {
    navigator.serviceWorker.register('/serviceworker.js').then(onRegistration);
  }

  function onRegistration(registration) {
    if (!navigator.serviceWorker.controller) {
      log('No controller');
    }

    if (registration.waiting) {
      log('waiting', registration.waiting);
      registration.waiting.addEventListener('statechange', onStateChange('waiting'));
    }

    if (registration.installing) {
      log('installing', registration.installing);
      registration.installing.addEventListener('statechange', onStateChange('installing'));
    }

    if (registration.active) {
      log('active', registration.active);
      registration.active.addEventListener('statechange', onStateChange('active'));
    }

    registration.addEventListener('updatefound', function() {
      log('updatefound', registration.installing);
    });
  }

  function onStateChange(initialState) {
    return function(e) {
      log('statechange', 'initial state', initialState, 'changed to', e.target.state);
    }
  }

  function log() {
    console.log("[Main]", ...arguments);
  }

  register();
})();
