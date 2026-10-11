class Node {
  constructor(val, left = null, right = null) {
    this.val = val;
    this.left = left;
    this.right = right;
  }
}

function lca(root, p, q) {
  if (!root || root === p || root === q) return root;
  const left = lca(root.left, p, q);
  const right = lca(root.right, p, q);
  if (left && right) return root;
  return left ?? right;
}

const n6 = new Node(6);
const n4 = new Node(4);
const n2 = new Node(2, new Node(7), n4);
const n5 = new Node(5, n6, n2);
const n1 = new Node(1, new Node(0), new Node(8));
const root = new Node(3, n5, n1);

console.log(lca(root, n6, n4).val);
console.log(lca(root, n5, n1).val);
console.log(lca(root, n5, n4).val);
