class BitSet {
  private bits = 0n;

  constructor(private size: number) {}

  set(index: number): void {
    this.bits |= 1n << BigInt(index);
  }

  clear(index: number): void {
    this.bits &= ~(1n << BigInt(index));
  }

  toggle(index: number): void {
    this.bits ^= 1n << BigInt(index);
  }

  get(index: number): boolean {
    return (this.bits & (1n << BigInt(index))) !== 0n;
  }

  count(): number {
    let n = this.bits;
    let count = 0;
    while (n > 0n) {
      count += Number(n & 1n);
      n >>= 1n;
    }
    return count;
  }
}

const bs = new BitSet(8);
bs.set(1);
bs.set(3);
bs.toggle(3);
console.log(bs.get(1), bs.get(3), bs.count());
