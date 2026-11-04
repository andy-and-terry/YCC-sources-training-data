class MinStack<T> {
  private items: { value: T; min: T }[] = [];

  constructor(private readonly less: (a: T, b: T) => boolean) {}

  push(value: T): void {
    const top = this.items[this.items.length - 1];
    const min = top && !this.less(value, top.min) ? top.min : value;
    this.items.push({ value, min });
  }

  pop(): T | undefined {
    return this.items.pop()?.value;
  }

  get min(): T | undefined {
    return this.items[this.items.length - 1]?.min;
  }
}

const s = new MinStack<number>((a, b) => a < b);
[5, 3, 7, 2].forEach((v) => s.push(v));
console.log(s.min); // 2
s.pop();
console.log(s.min); // 3
