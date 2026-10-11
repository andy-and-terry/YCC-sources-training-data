interface TreeNode {
  value: number;
  left: TreeNode | null;
  right: TreeNode | null;
}

const node = (value: number, left: TreeNode | null = null, right: TreeNode | null = null): TreeNode => ({
  value,
  left,
  right,
});

function lowestCommonAncestor(root: TreeNode | null, a: number, b: number): TreeNode | null {
  if (root === null || root.value === a || root.value === b) return root;
  const left = lowestCommonAncestor(root.left, a, b);
  const right = lowestCommonAncestor(root.right, a, b);
  if (left && right) return root;
  return left ?? right;
}

const tree = node(3, node(5, node(6), node(2, node(7), node(4))), node(1, node(0), node(8)));
console.log(lowestCommonAncestor(tree, 5, 1)?.value);
console.log(lowestCommonAncestor(tree, 5, 4)?.value);
console.log(lowestCommonAncestor(tree, 7, 8)?.value);
