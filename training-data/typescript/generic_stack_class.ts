class Stack<T> {
  private items: T[] = [];

  push(item: T): void {
    this.items.push(item);
  }

  pop(): T | undefined {
    return this.items.pop();
  }

  peek(): T | undefined {
    return this.items[this.items.length - 1];
  }

  get size(): number {
    return this.items.length;
  }

  isEmpty(): boolean {
    return this.items.length === 0;
  }

  toArray(): readonly T[] {
    return [...this.items];
  }
}

const s = new Stack<string>();
s.push("a");
s.push("b");
s.push("c");
console.log(s.peek(), s.size);
console.log(s.pop(), s.pop(), s.toArray());
console.log(s.isEmpty(), new Stack<number>().pop());
