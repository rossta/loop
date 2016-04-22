export default class SWClient {
  constructor() {
    this.registerServiceWorker();
  }

  log(msg) {
    console.log(`SWClient: ${msg}`);
  }

  registerServiceWorker() {
    const self = this;

    if (navigator.serviceWorker) {
      self.log('Registering service worker...');
    } else {
      self.log('No browser support for service worker');
      return;
    }

    navigator.serviceWorker.register('/serviceworker.js').then(onRegistration(self));
  }
}

function onRegistration(client) {
  return function(reg) {
    client.log('SWClient: Registered!');

    if (!navigator.serviceWorker.controller) {
      client.log('No controller');
      return;
    }

    if (reg.waiting) {
      indexController._updateReady(reg.waiting);
      return;
    }

    if (reg.installing) {
      indexController._trackInstalling(reg.installing);
      return;
    }

    reg.addEventListener('updatefound', function() {
      indexController._trackInstalling(reg.installing);
    });

  }
}
