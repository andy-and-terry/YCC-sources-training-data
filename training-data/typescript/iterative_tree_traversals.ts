class TNode {
  constructor(
    public value: number,
    public left: TNode | null = null,
    public right: TNode | null = null,
  ) {}
}

function inorder(root: TNode | null): number[] {
  const out: number[] = [];
  const stack: TNode[] = [];
  let cur = root;
  while (cur !== null || stack.length > 0) {
    while (cur !== null) {
      stack.push(cur);
      cur = cur.left;
    }
    const top = stack.pop()!;
    out.push(top.value);
    cur = top.right;
  }
  return out;
}

function preorder(root: TNode | null): number[] {
  const out: number[] = [];
  const stack: TNode[] = root ? [root] : [];
  while (stack.length > 0) {
    const n = stack.pop()!;
    out.push(n.value);
    if (n.right) stack.push(n.right);
    if (n.left) stack.push(n.left);
  }
  return out;
}

function postorder(root: TNode | null): number[] {
  const out: number[] = [];
  const stack: TNode[] = root ? [root] : [];
  while (stack.length > 0) {
    const n = stack.pop()!;
    out.push(n.value);
    if (n.left) stack.push(n.left);
    if (n.right) stack.push(n.right);
  }
  return out.reverse();
}

const t = new TNode(4, new TNode(2, new TNode(1), new TNode(3)), new TNode(6, new TNode(5), new TNode(7)));
console.log(inorder(t));
console.log(preorder(t));
console.log(postorder(t));
