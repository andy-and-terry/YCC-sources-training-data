class AVLNode {
  constructor(value) {
    this.value = value;
    this.left = null;
    this.right = null;
    this.height = 1;
  }
}

function height(node) {
  return node ? node.height : 0;
}

function updateHeight(node) {
  node.height = 1 + Math.max(height(node.left), height(node.right));
}

function balanceFactor(node) {
  return node ? height(node.left) - height(node.right) : 0;
}

function rotateRight(y) {
  const x = y.left;
  y.left = x.right;
  x.right = y;
  updateHeight(y);
  updateHeight(x);
  return x;
}

function rotateLeft(x) {
  const y = x.right;
  x.right = y.left;
  y.left = x;
  updateHeight(x);
  updateHeight(y);
  return y;
}

function insert(node, value) {
  if (!node) return new AVLNode(value);
  if (value < node.value) node.left = insert(node.left, value);
  else if (value > node.value) node.right = insert(node.right, value);
  else return node;

  updateHeight(node);
  const balance = balanceFactor(node);

  if (balance > 1 && value < node.left.value) return rotateRight(node);
  if (balance < -1 && value > node.right.value) return rotateLeft(node);
  if (balance > 1 && value > node.left.value) {
    node.left = rotateLeft(node.left);
    return rotateRight(node);
  }
  if (balance < -1 && value < node.right.value) {
    node.right = rotateRight(node.right);
    return rotateLeft(node);
  }
  return node;
}

function inorder(node, result = []) {
  if (!node) return result;
  inorder(node.left, result);
  result.push(node.value);
  inorder(node.right, result);
  return result;
}

class AVLTree {
  constructor() {
    this.root = null;
  }
  insert(value) {
    this.root = insert(this.root, value);
  }
  inorder() {
    return inorder(this.root);
  }
  height() {
    return height(this.root);
  }
}

const tree = new AVLTree();
[10, 20, 30, 40, 50, 25].forEach((v) => tree.insert(v));
console.log(tree.inorder());
console.log(tree.height());
module.exports = { AVLTree };
