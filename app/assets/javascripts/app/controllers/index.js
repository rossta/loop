export default class IndexController {
  constructor(container) {
    this.container = container;

    this.registerServiceWorker();
  }

  registerServiceWorker() {
    console.log('registering service worker');
  }
}

