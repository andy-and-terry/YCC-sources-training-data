class Deque {
  #buf;
  #head = 0;
  #size = 0;

  constructor(capacity = 4) {
    this.#buf = new Array(capacity);
  }

  get length() {
    return this.#size;
  }

  #grow() {
    this.#buf = [...this, ...new Array(this.#buf.length)];
    this.#head = 0;
  }

  pushBack(x) {
    if (this.#size === this.#buf.length) this.#grow();
    this.#buf[(this.#head + this.#size++) % this.#buf.length] = x;
  }

  pushFront(x) {
    if (this.#size === this.#buf.length) this.#grow();
    this.#head = (this.#head - 1 + this.#buf.length) % this.#buf.length;
    this.#buf[this.#head] = x;
    this.#size++;
  }

  popFront() {
    if (!this.#size) throw new RangeError("empty deque");
    const x = this.#buf[this.#head];
    this.#buf[this.#head] = undefined;
    this.#head = (this.#head + 1) % this.#buf.length;
    this.#size--;
    return x;
  }

  popBack() {
    if (!this.#size) throw new RangeError("empty deque");
    const i = (this.#head + --this.#size) % this.#buf.length;
    const x = this.#buf[i];
    this.#buf[i] = undefined;
    return x;
  }

  *[Symbol.iterator]() {
    for (let i = 0; i < this.#size; i++) yield this.#buf[(this.#head + i) % this.#buf.length];
  }
}

const d = new Deque();
for (let i = 0; i < 5; i++) {
  d.pushBack(i);
  d.pushFront(-i);
}
console.log([...d].join(" "));
console.log(d.popFront(), d.popBack(), [...d].join(" "));
module.exports = { Deque };
