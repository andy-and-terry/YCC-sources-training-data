class SkipListNode {
  constructor(value, level) {
    this.value = value;
    this.forward = new Array(level + 1).fill(null);
  }
}

class SkipList {
  constructor(maxLevel = 4, p = 0.5) {
    this.maxLevel = maxLevel;
    this.p = p;
    this.level = 0;
    this.header = new SkipListNode(-Infinity, maxLevel);
  }

  randomLevel() {
    let lvl = 0;
    while (Math.random() < this.p && lvl < this.maxLevel) lvl++;
    return lvl;
  }

  insert(value) {
    const update = new Array(this.maxLevel + 1).fill(this.header);
    let current = this.header;
    for (let i = this.level; i >= 0; i--) {
      while (current.forward[i] && current.forward[i].value < value) {
        current = current.forward[i];
      }
      update[i] = current;
    }
    current = current.forward[0];
    if (!current || current.value !== value) {
      const level = this.randomLevel();
      if (level > this.level) {
        for (let i = this.level + 1; i <= level; i++) update[i] = this.header;
        this.level = level;
      }
      const node = new SkipListNode(value, level);
      for (let i = 0; i <= level; i++) {
        node.forward[i] = update[i].forward[i];
        update[i].forward[i] = node;
      }
    }
  }

  contains(value) {
    let current = this.header;
    for (let i = this.level; i >= 0; i--) {
      while (current.forward[i] && current.forward[i].value < value) {
        current = current.forward[i];
      }
    }
    current = current.forward[0];
    return current !== null && current.value === value;
  }

  toArray() {
    const result = [];
    let current = this.header.forward[0];
    while (current) {
      result.push(current.value);
      current = current.forward[0];
    }
    return result;
  }
}

const list = new SkipList();
[3, 6, 7, 9, 12, 19, 17, 26, 21, 25].forEach((v) => list.insert(v));
console.log(list.toArray());
console.log(list.contains(19), list.contains(15));
module.exports = { SkipList };
