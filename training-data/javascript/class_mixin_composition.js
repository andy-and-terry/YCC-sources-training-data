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

class Item {
  constructor(value) {
    this.value = value;
  }
}

class RichItem extends Comparable(Serializable(Item)) {}

const a = new RichItem(5);
const b = new RichItem(9);
console.log(a.serialize());
console.log(a.compareTo(b));
console.log(a instanceof Item);
