class PubSub {
  #subscribers = new Map();

  subscribe(topic, handler) {
    if (!this.#subscribers.has(topic)) this.#subscribers.set(topic, []);
    this.#subscribers.get(topic).push(handler);
  }

  publish(topic, message) {
    for (const handler of this.#subscribers.get(topic) || []) handler(message);
  }
}

const bus = new PubSub();
bus.subscribe('news', (msg) => console.log(`received: ${msg}`));
bus.publish('news', 'hello subscribers');
module.exports = { PubSub };
