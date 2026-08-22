class DNode {
  constructor(value) {
    this.value = value;
    this.prev = null;
    this.next = null;
  }
}

class DoublyLinkedList {
  constructor() {
    this.head = null;
    this.tail = null;
  }

  append(value) {
    const node = new DNode(value);
    if (!this.head) {
      this.head = this.tail = node;
      return;
    }
    node.prev = this.tail;
    this.tail.next = node;
    this.tail = node;
  }

  remove(value) {
    let node = this.head;
    while (node) {
      if (node.value === value) {
        if (node.prev) node.prev.next = node.next;
        else this.head = node.next;
        if (node.next) node.next.prev = node.prev;
        else this.tail = node.prev;
        return true;
      }
      node = node.next;
    }
    return false;
  }

  toArray() {
    const result = [];
    let node = this.head;
    while (node) {
      result.push(node.value);
      node = node.next;
    }
    return result;
  }
}

const dll = new DoublyLinkedList();
[1, 2, 3, 4].forEach((v) => dll.append(v));
dll.remove(3);
console.log(dll.toArray());
module.exports = { DoublyLinkedList };
