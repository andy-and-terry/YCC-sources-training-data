class PriorityQueue {
  #items = [];

  push(item, priority) {
    this.#items.push({ item, priority });
    this.#items.sort((a, b) => a.priority - b.priority);
  }

  pop() {
    return this.#items.shift()?.item;
  }

  isEmpty() {
    return this.#items.length === 0;
  }
}

const pq = new PriorityQueue();
pq.push('low', 5);
pq.push('high', 1);
pq.push('medium', 3);
console.log(pq.pop(), pq.pop(), pq.pop());
module.exports = { PriorityQueue };
