const Serializable = (Base) =>
  class extends Base {
    serialize() {
      return JSON.stringify(this);
    }
  };

const Comparable = (Base) =>
  class extends Base {
    compareTo(other) {
      return this.value - other.value;
    }
  };

class Box {
  constructor(value) {
    this.value = value;
  }
}

class ComparableSerializableBox extends Serializable(Comparable(Box)) {}

const a = new ComparableSerializableBox(3);
const b = new ComparableSerializableBox(7);

console.log(a.serialize());
console.log(a.compareTo(b));
console.log([b, a].sort((x, y) => x.compareTo(y)).map((box) => box.value));

module.exports = { Serializable, Comparable, Box };
