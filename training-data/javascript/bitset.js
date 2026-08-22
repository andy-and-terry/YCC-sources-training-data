class BitSet {
  constructor(size) {
    this.size = size;
    this.bits = 0n;
  }

  set(index) {
    this.bits |= 1n << BigInt(index);
  }

  clear(index) {
    this.bits &= ~(1n << BigInt(index));
  }

  toggle(index) {
    this.bits ^= 1n << BigInt(index);
  }

  get(index) {
    return (this.bits & (1n << BigInt(index))) !== 0n;
  }

  count() {
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
module.exports = { BitSet };
