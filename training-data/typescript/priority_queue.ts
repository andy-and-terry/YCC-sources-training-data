interface QueueEntry<T> {
  item: T;
  priority: number;
}

class PriorityQueue<T> {
  private items: QueueEntry<T>[] = [];

  push(item: T, priority: number): void {
    this.items.push({ item, priority });
    this.items.sort((a, b) => a.priority - b.priority);
  }

  pop(): T | undefined {
    return this.items.shift()?.item;
  }

  isEmpty(): boolean {
    return this.items.length === 0;
  }
}

const pq = new PriorityQueue<string>();
pq.push('low', 5);
pq.push('high', 1);
pq.push('medium', 3);
console.log(pq.pop(), pq.pop(), pq.pop());
