class DNode<T> {
  prev: DNode<T> | null = null;
  next: DNode<T> | null = null;
  constructor(public value: T) {}
}

class DoublyLinkedList<T> {
  private head: DNode<T> | null = null;
  private tail: DNode<T> | null = null;

  append(value: T): void {
    const node = new DNode(value);
    if (!this.head || !this.tail) {
      this.head = this.tail = node;
      return;
    }
    node.prev = this.tail;
    this.tail.next = node;
    this.tail = node;
  }

  remove(value: T): boolean {
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

  toArray(): T[] {
    const result: T[] = [];
    let node = this.head;
    while (node) {
      result.push(node.value);
      node = node.next;
    }
    return result;
  }
}

const dll = new DoublyLinkedList<number>();
[1, 2, 3, 4].forEach((v) => dll.append(v));
dll.remove(3);
console.log(dll.toArray());
