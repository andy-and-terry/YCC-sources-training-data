class ListNode<T> {
  next: ListNode<T> | null = null;
  constructor(public val: T) {}
}

export function cycleInfo<T>(head: ListNode<T> | null): { start: T; length: number } | null {
  let slow = head, fast = head;
  while (fast?.next) {
    slow = slow!.next;
    fast = fast.next.next;
    if (slow === fast) {
      let length = 1;
      for (let p = slow!.next; p !== slow; p = p!.next) length++;
      let a = head!, b = slow!;
      while (a !== b) {
        a = a.next!;
        b = b.next!;
      }
      return { start: a.val, length };
    }
  }
  return null;
}

function build<T>(values: T[], loopTo = -1): ListNode<T> {
  const nodes = values.map((v) => new ListNode(v));
  nodes.forEach((n, i) => (n.next = nodes[i + 1] ?? null));
  if (loopTo >= 0) nodes[nodes.length - 1].next = nodes[loopTo];
  return nodes[0];
}

console.log(cycleInfo(build(["a", "b", "c", "d", "e"], 2)), cycleInfo(build([1, 2, 3])));
