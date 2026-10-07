class TreeType {
  constructor(name, color, texture) {
    this.name = name;
    this.color = color;
    this.texture = texture;
  }
  draw(x, y) {
    return `${this.name}(${this.color}, ${this.texture}) at (${x}, ${y})`;
  }
}

class TreeFactory {
  constructor() {
    this.types = new Map();
  }
  getType(name, color, texture) {
    const key = `${name}:${color}:${texture}`;
    if (!this.types.has(key)) {
      this.types.set(key, new TreeType(name, color, texture));
    }
    return this.types.get(key);
  }
  get typeCount() {
    return this.types.size;
  }
}

class Forest {
  constructor() {
    this.factory = new TreeFactory();
    this.trees = [];
  }
  plant(x, y, name, color, texture) {
    const type = this.factory.getType(name, color, texture);
    this.trees.push({ x, y, type });
  }
  draw() {
    return this.trees.map((t) => t.type.draw(t.x, t.y));
  }
}

const forest = new Forest();
forest.plant(1, 2, 'Oak', 'green', 'rough');
forest.plant(5, 6, 'Oak', 'green', 'rough');
forest.plant(3, 9, 'Pine', 'dark-green', 'smooth');

console.log(forest.draw());
console.log(`distinct flyweights: ${forest.factory.typeCount}`);
module.exports = { TreeType, TreeFactory, Forest };
