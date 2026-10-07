class Node {
  constructor(val) {
    this.val = val;
    this.next = null;
  }
}

function findCycleStart(head) {
  let slow = head, fast = head;
  while (fast && fast.next) {
    slow = slow.next;
    fast = fast.next.next;
    if (slow === fast) {
      slow = head;
      while (slow !== fast) {
        slow = slow.next;
        fast = fast.next;
      }
      return slow;
    }
  }
  return null;
}

function build(values, loopTo = -1) {
  const nodes = values.map((v) => new Node(v));
  nodes.forEach((n, i) => (n.next = nodes[i + 1] ?? null));
  if (loopTo >= 0) nodes.at(-1).next = nodes[loopTo];
  return nodes[0];
}

console.log(findCycleStart(build([3, 2, 0, -4], 1)).val, findCycleStart(build([1, 2, 3])));
module.exports = { findCycleStart };
