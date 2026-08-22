class Node {
  constructor(value) {
    this.value = value;
    this.left = null;
    this.right = null;
  }
}

class BinaryTree {
  constructor() {
    this.root = null;
  }

  insert(value) {
    this.root = this.#insert(this.root, value);
  }

  #insert(node, value) {
    if (!node) return new Node(value);
    if (value < node.value) node.left = this.#insert(node.left, value);
    else node.right = this.#insert(node.right, value);
    return node;
  }

  inOrder() {
    const result = [];
    this.#inOrder(this.root, result);
    return result;
  }

  #inOrder(node, result) {
    if (!node) return;
    this.#inOrder(node.left, result);
    result.push(node.value);
    this.#inOrder(node.right, result);
  }
}

const tree = new BinaryTree();
[5, 3, 8, 1, 4, 7, 9].forEach((v) => tree.insert(v));
console.log(tree.inOrder());
module.exports = { BinaryTree };
