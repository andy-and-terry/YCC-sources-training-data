interface Node2 { next?: Node2; v: number }
const n: Node2 = { v: 1, next: { v: 2 } };
console.log(n.next?.next?.v ?? "end", n.next?.v);
