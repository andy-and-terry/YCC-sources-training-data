class SkipListNode {
  forward: (SkipListNode | undefined)[];

  constructor(
    public value: number,
    level: number,
  ) {
    this.forward = new Array(level + 1).fill(undefined);
  }
}

class SkipList {
  private readonly maxLevel = 4;
  private level = 0;
  private readonly head = new SkipListNode(-Infinity, 4);

  private randomLevel(): number {
    let lvl = 0;
    while (Math.random() < 0.5 && lvl < this.maxLevel) lvl++;
    return lvl;
  }

  insert(value: number): void {
    const update: SkipListNode[] = new Array(this.maxLevel + 1).fill(this.head);
    let current = this.head;

    for (let i = this.level; i >= 0; i--) {
      while (current.forward[i] && current.forward[i]!.value < value) {
        current = current.forward[i]!;
      }
      update[i] = current;
    }

    const newLevel = this.randomLevel();
    if (newLevel > this.level) {
      for (let i = this.level + 1; i <= newLevel; i++) update[i] = this.head;
      this.level = newLevel;
    }

    const node = new SkipListNode(value, newLevel);
    for (let i = 0; i <= newLevel; i++) {
      node.forward[i] = update[i].forward[i];
      update[i].forward[i] = node;
    }
  }

  contains(value: number): boolean {
    let current = this.head;
    for (let i = this.level; i >= 0; i--) {
      while (current.forward[i] && current.forward[i]!.value < value) {
        current = current.forward[i]!;
      }
    }
    const candidate = current.forward[0];
    return candidate !== undefined && candidate.value === value;
  }
}

const list = new SkipList();
[3, 6, 7, 9, 12, 19, 17].forEach((v) => list.insert(v));
console.log(list.contains(19));
console.log(list.contains(15));
