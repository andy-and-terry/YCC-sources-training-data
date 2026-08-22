class Node<T> {
  value: T;
  next: Node<T> | null;

  constructor(value: T, next: Node<T> | null = null) {
    this.value = value;
    this.next = next;
  }
}

function reverse<T>(head: Node<T> | null): Node<T> | null {
  let prev: Node<T> | null = null;
  let current = head;
  while (current) {
    const nextNode: Node<T> | null = current.next;
    current.next = prev;
    prev = current;
    current = nextNode;
  }
  return prev;
}

function toArray<T>(head: Node<T> | null): T[] {
  const result: T[] = [];
  let node = head;
  while (node) {
    result.push(node.value);
    node = node.next;
  }
  return result;
}

const head = new Node(1, new Node(2, new Node(3, new Node(4))));
console.log(toArray(reverse(head)));
