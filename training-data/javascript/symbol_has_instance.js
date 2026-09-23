class EvenNumber {
  static [Symbol.hasInstance](value) {
    return typeof value === 'number' && value % 2 === 0;
  }
}

class Range {
  constructor(min, max) {
    this.min = min;
    this.max = max;
  }
  [Symbol.hasInstance](value) {
    return typeof value === 'number' && value >= this.min && value <= this.max;
  }
  get [Symbol.toStringTag]() {
    return `Range(${this.min}-${this.max})`;
  }
}

console.log(4 instanceof EvenNumber);
console.log(7 instanceof EvenNumber);

const smallRange = new Range(1, 10);
console.log(5 instanceof smallRange);
console.log(20 instanceof smallRange);
console.log(Object.prototype.toString.call(smallRange));
console.log(`${smallRange}`);

module.exports = { EvenNumber, Range };
