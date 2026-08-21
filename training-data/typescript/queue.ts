export class Queue<T> {
  private items: T[] = [];

  enqueue(item: T): void {
    this.items.push(item);
  }

  dequeue(): T | undefined {
    return this.items.shift();
  }

  peek(): T | undefined {
    return this.items[0];
  }

  get isEmpty(): boolean {
    return this.items.length === 0;
  }
}

const q = new Queue<number>();
q.enqueue(1);
q.enqueue(2);
q.enqueue(3);
console.log(q.dequeue(), q.peek(), q.isEmpty);
