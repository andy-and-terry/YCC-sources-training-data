class Queue {
  constructor() { this.inS = []; this.outS = []; }
  enqueue(x) { this.inS.push(x); }
  dequeue() {
    if (!this.outS.length) while (this.inS.length) this.outS.push(this.inS.pop());
    return this.outS.pop();
  }
}
const q = new Queue();
[1, 2, 3].forEach((x) => q.enqueue(x));
console.log(q.dequeue(), q.dequeue());
