class Stack<T> {
  private items: T[] = [];
  push(x: T): this { this.items.push(x); return this; }
  pop(): T | undefined { return this.items.pop(); }
  get size(): number { return this.items.length; }
}
const s = new Stack<string>().push("a").push("b");
console.log(s.pop(), s.size);
