const crypto = require('crypto');

class BloomFilter {
  constructor(size = 1000, numHashes = 3) {
    this.size = size;
    this.numHashes = numHashes;
    this.bits = new Array(size).fill(false);
  }

  *#hashes(item) {
    for (let i = 0; i < this.numHashes; i++) {
      const digest = crypto.createHash('sha256').update(`${i}:${item}`).digest('hex');
      yield parseInt(digest.slice(0, 8), 16) % this.size;
    }
  }

  add(item) {
    for (const idx of this.#hashes(item)) this.bits[idx] = true;
  }

  mightContain(item) {
    for (const idx of this.#hashes(item)) {
      if (!this.bits[idx]) return false;
    }
    return true;
  }
}

const bf = new BloomFilter();
bf.add('hello');
console.log(bf.mightContain('hello'), bf.mightContain('world'));
module.exports = { BloomFilter };
