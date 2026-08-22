class CircularBuffer {
  constructor(capacity) {
    this.capacity = capacity;
    this.buffer = new Array(capacity);
    this.head = 0;
    this.size = 0;
  }

  append(item) {
    const tail = (this.head + this.size) % this.capacity;
    this.buffer[tail] = item;
    if (this.size < this.capacity) {
      this.size++;
    } else {
      this.head = (this.head + 1) % this.capacity;
    }
  }

  toArray() {
    return Array.from({ length: this.size }, (_, i) => this.buffer[(this.head + i) % this.capacity]);
  }
}

const cb = new CircularBuffer(3);
for (let i = 0; i < 5; i++) cb.append(i);
console.log(cb.toArray());
module.exports = { CircularBuffer };
