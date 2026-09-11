const MAX_LEVEL = 16;
const P = 0.5;

class SkipListNode {
  constructor(value, level) {
    this.value = value;
    this.forward = new Array(level + 1).fill(null);
  }
}

class SkipList {
  constructor() {
    this.head = new SkipListNode(-Infinity, MAX_LEVEL);
    this.level = 0;
  }

  #randomLevel() {
    let lvl = 0;
    while (lvl < MAX_LEVEL && Math.random() < P) lvl++;
    return lvl;
  }

  insert(value) {
    const update = new Array(MAX_LEVEL + 1).fill(this.head);
    let current = this.head;

    for (let i = this.level; i >= 0; i--) {
      while (current.forward[i] && current.forward[i].value < value) {
        current = current.forward[i];
      }
      update[i] = current;
    }

    const newLevel = this.#randomLevel();
    if (newLevel > this.level) {
      for (let i = this.level + 1; i <= newLevel; i++) update[i] = this.head;
      this.level = newLevel;
    }

    const newNode = new SkipListNode(value, newLevel);
    for (let i = 0; i <= newLevel; i++) {
      newNode.forward[i] = update[i].forward[i];
      update[i].forward[i] = newNode;
    }
  }

  contains(value) {
    let current = this.head;
    for (let i = this.level; i >= 0; i--) {
      while (current.forward[i] && current.forward[i].value < value) {
        current = current.forward[i];
      }
    }
    current = current.forward[0];
    return current !== null && current.value === value;
  }
}

const list = new SkipList();
for (const v of [3, 6, 7, 9, 12, 19, 17, 26, 21, 25]) list.insert(v);
console.log(list.contains(19));
console.log(list.contains(15));
console.log(list.contains(25));

module.exports = { SkipList };
