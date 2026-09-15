class SkipNode {
  forward: (SkipNode | null)[];
  constructor(public value: number, level: number) {
    this.forward = new Array(level + 1).fill(null);
  }
}

class SkipList {
  private static readonly MAX_LEVEL = 4;
  private static readonly P = 0.5;

  private head = new SkipNode(-Infinity, SkipList.MAX_LEVEL);
  private level = 0;

  private randomLevel(): number {
    let lvl = 0;
    while (Math.random() < SkipList.P && lvl < SkipList.MAX_LEVEL) {
      lvl++;
    }
    return lvl;
  }

  insert(value: number): void {
    const update: SkipNode[] = new Array(SkipList.MAX_LEVEL + 1).fill(this.head);
    let current = this.head;

    for (let i = this.level; i >= 0; i--) {
      while (current.forward[i] && current.forward[i]!.value < value) {
        current = current.forward[i]!;
      }
      update[i] = current;
    }

    const newLevel = this.randomLevel();
    if (newLevel > this.level) {
      for (let i = this.level + 1; i <= newLevel; i++) {
        update[i] = this.head;
      }
      this.level = newLevel;
    }

    const node = new SkipNode(value, newLevel);
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
    current = current.forward[0]!;
    return current !== null && current !== undefined && current.value === value;
  }

  toArray(): number[] {
    const result: number[] = [];
    let node = this.head.forward[0];
    while (node) {
      result.push(node.value);
      node = node.forward[0];
    }
    return result;
  }
}

const list = new SkipList();
[3, 6, 7, 9, 12, 19, 17, 26, 21, 25].forEach((v) => list.insert(v));
console.log(list.toArray());
console.log(list.contains(19));
console.log(list.contains(100));
