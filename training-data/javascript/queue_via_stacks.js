class QueueViaStacks {
  #in = [];
  #out = [];

  enqueue(item) {
    this.#in.push(item);
  }

  dequeue() {
    if (this.#out.length === 0) {
      while (this.#in.length > 0) this.#out.push(this.#in.pop());
    }
    return this.#out.pop();
  }

  isEmpty() {
    return this.#in.length === 0 && this.#out.length === 0;
  }
}

const q = new QueueViaStacks();
q.enqueue(1);
q.enqueue(2);
q.enqueue(3);
console.log(q.dequeue(), q.dequeue(), q.isEmpty());
module.exports = { QueueViaStacks };
