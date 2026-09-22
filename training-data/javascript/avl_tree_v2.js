class AVLNode {
  constructor(value) {
    this.value = value;
    this.left = null;
    this.right = null;
    this.height = 1;
  }
}

class AVLTree {
  constructor() {
    this.root = null;
  }

  #height(node) {
    return node ? node.height : 0;
  }

  #balanceFactor(node) {
    return node ? this.#height(node.left) - this.#height(node.right) : 0;
  }

  #updateHeight(node) {
    node.height = 1 + Math.max(this.#height(node.left), this.#height(node.right));
  }

  #rotateRight(y) {
    const x = y.left;
    const t2 = x.right;
    x.right = y;
    y.left = t2;
    this.#updateHeight(y);
    this.#updateHeight(x);
    return x;
  }

  #rotateLeft(x) {
    const y = x.right;
    const t2 = y.left;
    y.left = x;
    x.right = t2;
    this.#updateHeight(x);
    this.#updateHeight(y);
    return y;
  }

  insert(value) {
    this.root = this.#insert(this.root, value);
  }

  #insert(node, value) {
    if (!node) return new AVLNode(value);
    if (value < node.value) node.left = this.#insert(node.left, value);
    else if (value > node.value) node.right = this.#insert(node.right, value);
    else return node;

    this.#updateHeight(node);
    const balance = this.#balanceFactor(node);

    if (balance > 1 && value < node.left.value) return this.#rotateRight(node);
    if (balance < -1 && value > node.right.value) return this.#rotateLeft(node);
    if (balance > 1 && value > node.left.value) {
      node.left = this.#rotateLeft(node.left);
      return this.#rotateRight(node);
    }
    if (balance < -1 && value < node.right.value) {
      node.right = this.#rotateRight(node.right);
      return this.#rotateLeft(node);
    }
    return node;
  }

  inOrder() {
    const result = [];
    const walk = (node) => {
      if (!node) return;
      walk(node.left);
      result.push(node.value);
      walk(node.right);
    };
    walk(this.root);
    return result;
  }
}

const tree = new AVLTree();
[10, 20, 30, 40, 50, 25].forEach((v) => tree.insert(v));
console.log(tree.inOrder());
console.log(tree.root.value);
module.exports = { AVLTree };
