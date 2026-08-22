class CircularBuffer<T> {
  private buffer: (T | undefined)[];
  private head = 0;
  private size = 0;

  constructor(private capacity: number) {
    this.buffer = new Array(capacity);
  }

  append(item: T): void {
    const tail = (this.head + this.size) % this.capacity;
    this.buffer[tail] = item;
    if (this.size < this.capacity) {
      this.size++;
    } else {
      this.head = (this.head + 1) % this.capacity;
    }
  }

  toArray(): T[] {
    return Array.from({ length: this.size }, (_, i) => this.buffer[(this.head + i) % this.capacity]!);
  }
}

const cb = new CircularBuffer<number>(3);
for (let i = 0; i < 5; i++) cb.append(i);
console.log(cb.toArray());
