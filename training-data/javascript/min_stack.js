class MinStack {
  #items = [];
  #mins = [];

  push(value) {
    this.#items.push(value);
    this.#mins.push(this.#mins.length === 0 ? value : Math.min(value, this.#mins.at(-1)));
  }

  pop() {
    this.#mins.pop();
    return this.#items.pop();
  }

  top() {
    return this.#items.at(-1);
  }

  getMin() {
    return this.#mins.at(-1);
  }
}

const s = new MinStack();
s.push(3);
s.push(1);
s.push(2);
console.log(s.getMin());
s.pop();
console.log(s.getMin());
module.exports = { MinStack };
