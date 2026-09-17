class BloomFilter {
  private bits: Uint8Array;
  private size: number;
  private hashCount: number;

  constructor(size: number, hashCount: number) {
    this.size = size;
    this.hashCount = hashCount;
    this.bits = new Uint8Array(size);
  }

  private hash(value: string, seed: number): number {
    let h = seed;
    for (let i = 0; i < value.length; i++) {
      h = (h * 31 + value.charCodeAt(i)) >>> 0;
    }
    return h % this.size;
  }

  add(value: string): void {
    for (let i = 0; i < this.hashCount; i++) {
      this.bits[this.hash(value, i + 1)] = 1;
    }
  }

  mightContain(value: string): boolean {
    for (let i = 0; i < this.hashCount; i++) {
      if (this.bits[this.hash(value, i + 1)] === 0) return false;
    }
    return true;
  }
}

const filter = new BloomFilter(64, 3);
filter.add("apple");
filter.add("banana");

console.log(filter.mightContain("apple"));  // true
console.log(filter.mightContain("banana")); // true
console.log(filter.mightContain("cherry")); // almost certainly false
