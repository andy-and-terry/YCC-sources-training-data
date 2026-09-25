export class Deque<T> implements Iterable<T> {
  private buf: (T | undefined)[];
  private head = 0;
  private count = 0;

  constructor(capacity = 4) {
    this.buf = new Array(capacity);
  }

  get size(): number {
    return this.count;
  }

  private idx(i: number): number {
    return (this.head + i) % this.buf.length;
  }

  private grow(): void {
    const items = [...this];
    this.buf = [...items, ...new Array<T | undefined>(items.length || 1)];
    this.head = 0;
  }

  pushBack(x: T): void {
    if (this.count === this.buf.length) this.grow();
    this.buf[this.idx(this.count++)] = x;
  }

  pushFront(x: T): void {
    if (this.count === this.buf.length) this.grow();
    this.head = (this.head - 1 + this.buf.length) % this.buf.length;
    this.buf[this.head] = x;
    this.count++;
  }

  popFront(): T | undefined {
    if (!this.count) return undefined;
    const x = this.buf[this.head];
    this.buf[this.head] = undefined;
    this.head = this.idx(1);
    this.count--;
    return x;
  }

  popBack(): T | undefined {
    if (!this.count) return undefined;
    const i = this.idx(--this.count);
    const x = this.buf[i];
    this.buf[i] = undefined;
    return x;
  }

  at(i: number): T | undefined {
    return i < 0 || i >= this.count ? undefined : this.buf[this.idx(i)];
  }

  *[Symbol.iterator](): Iterator<T> {
    for (let i = 0; i < this.count; i++) yield this.buf[this.idx(i)] as T;
  }
}

const d = new Deque<string>(2);
for (const w of ["c", "d", "e"]) d.pushBack(w);
for (const w of ["b", "a"]) d.pushFront(w);
console.log([...d].join(""), d.at(2), d.popFront(), d.popBack(), [...d].join(""));
