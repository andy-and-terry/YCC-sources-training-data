class MinStack {
  private items: number[] = [];
  private mins: number[] = [];

  push(value: number): void {
    this.items.push(value);
    const currentMin = this.mins.length === 0 ? value : Math.min(value, this.mins[this.mins.length - 1]);
    this.mins.push(currentMin);
  }

  pop(): number | undefined {
    this.mins.pop();
    return this.items.pop();
  }

  top(): number {
    return this.items[this.items.length - 1];
  }

  getMin(): number {
    return this.mins[this.mins.length - 1];
  }
}

const s = new MinStack();
s.push(3);
s.push(1);
s.push(2);
console.log(s.getMin());
s.pop();
console.log(s.getMin());
