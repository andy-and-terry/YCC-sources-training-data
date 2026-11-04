class MinStack {
  #items = [];
  push(x) {
    const cur = this.#items.length ? Math.min(x, this.#items.at(-1).min) : x;
    this.#items.push({ x, min: cur });
  }
  pop() { return this.#items.pop().x; }
  get min() { return this.#items.at(-1).min; }
}

const s = new MinStack();
[5, 3, 7, 2].forEach((v) => s.push(v));
console.log(s.min); // 2
s.pop();
console.log(s.min); // 3
