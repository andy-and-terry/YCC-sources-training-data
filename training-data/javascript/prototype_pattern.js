class Shape {
  constructor(type, color) {
    this.type = type;
    this.color = color;
  }
  clone() {
    return Object.assign(Object.create(Object.getPrototypeOf(this)), this);
  }
}

const original = new Shape('circle', 'red');
const copy = original.clone();
copy.color = 'blue';
console.log(original.type, original.color);
console.log(copy.type, copy.color);
console.log(original === copy);
module.exports = { Shape };
