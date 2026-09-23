class Counter {
  #count: number;
  static #instances = 0;

  constructor(start = 0) {
    this.#count = start;
    Counter.#instances++;
  }

  increment(): number {
    return ++this.#count;
  }

  #reset(): void {
    this.#count = 0;
  }

  resetPublic(): void {
    this.#reset();
  }

  get isPositive(): boolean {
    return this.#hasPositive();
  }

  #hasPositive(): boolean {
    return this.#count > 0;
  }

  static get instanceCount(): number {
    return Counter.#instances;
  }

  // Native `#` fields are only accessible from inside the declaring class,
  // even stricter than TypeScript's own `private` keyword (which is only
  // enforced at compile time and still visible via bracket-notation hacks).
  equals(other: Counter): boolean {
    return this.#count === other.#count;
  }
}

const c1 = new Counter(5);
console.log(c1.increment());
console.log(c1.isPositive);
c1.resetPublic();
console.log(c1.isPositive);

const c2 = new Counter();
console.log(Counter.instanceCount);
console.log(c1.equals(c2));
