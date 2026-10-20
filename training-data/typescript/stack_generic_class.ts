class Stack<T> {
  private items: T[] = [];
  push(x: T) { this.items.push(x); return this; }
  pop(): T | undefined { return this.items.pop(); }
  peek(): T | undefined { return this.items[this.items.length - 1]; }
  get size() { return this.items.length; }
}
const s = new Stack<string>().push("a").push("b");
console.log(s.pop(), s.size);
