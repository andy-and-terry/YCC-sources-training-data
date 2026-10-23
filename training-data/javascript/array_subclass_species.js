class Stack extends Array {
  peek() {
    return this[this.length - 1];
  }
}

class PlainResult extends Array {
  static get [Symbol.species]() {
    return Array;
  }
}

const s = Stack.from([1, 2, 3, 4]);
const doubled = s.map((x) => x * 2);
console.log(doubled instanceof Stack, doubled.peek());

const p = PlainResult.from([1, 2, 3, 4]);
const filtered = p.filter((x) => x > 2);
console.log(p instanceof PlainResult, filtered instanceof PlainResult);
console.log(filtered);
console.log(Array.isArray(s), s.length);
