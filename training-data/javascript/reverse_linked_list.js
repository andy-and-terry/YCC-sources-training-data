class Node {
  constructor(value, next = null) {
    this.value = value;
    this.next = next;
  }
}

function reverse(head) {
  let prev = null;
  let current = head;
  while (current) {
    const nextNode = current.next;
    current.next = prev;
    prev = current;
    current = nextNode;
  }
  return prev;
}

function toArray(head) {
  const result = [];
  while (head) {
    result.push(head.value);
    head = head.next;
  }
  return result;
}

const head = new Node(1, new Node(2, new Node(3, new Node(4))));
console.log(toArray(reverse(head)));
module.exports = { Node, reverse, toArray };
