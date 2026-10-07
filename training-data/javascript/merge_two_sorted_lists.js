const node = (val, next = null) => ({ val, next });
const fromArray = (xs) => xs.reduceRight((next, v) => node(v, next), null);
function toArray(n) {
  const out = [];
  for (; n; n = n.next) out.push(n.val);
  return out;
}

function merge(a, b) {
  const dummy = node(0);
  let tail = dummy;
  while (a && b) {
    if (a.val <= b.val) { tail.next = a; a = a.next; }
    else { tail.next = b; b = b.next; }
    tail = tail.next;
  }
  tail.next = a || b;
  return dummy.next;
}

console.log(toArray(merge(fromArray([1, 2, 4, 9]), fromArray([1, 3, 4, 5, 10]))));
module.exports = { merge };
