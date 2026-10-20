const list = { v: 1, next: { v: 2, next: { v: 3, next: null } } };
function reverse(head) {
  let prev = null;
  while (head) { [head.next, prev, head] = [prev, head, head.next]; }
  return prev;
}
let n = reverse(list);
while (n) { console.log(n.v); n = n.next; }
