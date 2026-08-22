type Handler<T> = (message: T) => void;

class PubSub<T = unknown> {
  private subscribers = new Map<string, Handler<T>[]>();

  subscribe(topic: string, handler: Handler<T>): void {
    if (!this.subscribers.has(topic)) this.subscribers.set(topic, []);
    this.subscribers.get(topic)!.push(handler);
  }

  publish(topic: string, message: T): void {
    for (const handler of this.subscribers.get(topic) ?? []) handler(message);
  }
}

const bus = new PubSub<string>();
bus.subscribe('news', (msg) => console.log(`received: ${msg}`));
bus.publish('news', 'hello subscribers');
