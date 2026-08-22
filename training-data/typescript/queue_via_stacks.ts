class QueueViaStacks<T> {
  private inStack: T[] = [];
  private outStack: T[] = [];

  enqueue(item: T): void {
    this.inStack.push(item);
  }

  dequeue(): T | undefined {
    if (this.outStack.length === 0) {
      while (this.inStack.length > 0) {
        const item = this.inStack.pop();
        if (item !== undefined) this.outStack.push(item);
      }
    }
    return this.outStack.pop();
  }

  isEmpty(): boolean {
    return this.inStack.length === 0 && this.outStack.length === 0;
  }
}

const q = new QueueViaStacks<number>();
q.enqueue(1);
q.enqueue(2);
q.enqueue(3);
console.log(q.dequeue(), q.dequeue(), q.isEmpty());
