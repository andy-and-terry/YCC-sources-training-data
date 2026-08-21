class Stack {
  #items = [];

  push(item) {
    this.#items.push(item);
  }

  pop() {
    return this.#items.pop();
  }

  peek() {
    return this.#items[this.#items.length - 1];
  }

  isEmpty() {
    return this.#items.length === 0;
  }
}

const s = new Stack();
s.push(1);
s.push(2);
s.push(3);
console.log(s.pop(), s.peek(), s.isEmpty());

module.exports = { Stack };
