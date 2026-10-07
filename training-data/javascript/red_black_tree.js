const RED = true;
const BLACK = false;

class Node {
  constructor(key, color) {
    this.key = key;
    this.color = color;
    this.left = null;
    this.right = null;
  }
}

class RedBlackTree {
  #root = null;

  #isRed(node) {
    return node !== null && node.color === RED;
  }

  #rotateLeft(h) {
    const x = h.right;
    h.right = x.left;
    x.left = h;
    x.color = h.color;
    h.color = RED;
    return x;
  }

  #rotateRight(h) {
    const x = h.left;
    h.left = x.right;
    x.right = h;
    x.color = h.color;
    h.color = RED;
    return x;
  }

  #flipColors(h) {
    h.color = !h.color;
    h.left.color = !h.left.color;
    h.right.color = !h.right.color;
  }

  insert(key) {
    this.#root = this.#insertNode(this.#root, key);
    this.#root.color = BLACK;
  }

  #insertNode(h, key) {
    if (h === null) return new Node(key, RED);

    if (key < h.key) h.left = this.#insertNode(h.left, key);
    else if (key > h.key) h.right = this.#insertNode(h.right, key);

    if (this.#isRed(h.right) && !this.#isRed(h.left)) h = this.#rotateLeft(h);
    if (this.#isRed(h.left) && this.#isRed(h.left.left)) h = this.#rotateRight(h);
    if (this.#isRed(h.left) && this.#isRed(h.right)) this.#flipColors(h);

    return h;
  }

  contains(key) {
    let cur = this.#root;
    while (cur !== null) {
      if (key === cur.key) return true;
      cur = key < cur.key ? cur.left : cur.right;
    }
    return false;
  }

  inorder() {
    const result = [];
    const walk = (n) => {
      if (n === null) return;
      walk(n.left);
      result.push(n.key);
      walk(n.right);
    };
    walk(this.#root);
    return result;
  }
}

const tree = new RedBlackTree();
[10, 20, 5, 15, 25, 1, 8].forEach((v) => tree.insert(v));
console.log('inorder:', tree.inorder());
console.log('contains 15:', tree.contains(15));
console.log('contains 99:', tree.contains(99));
module.exports = { RedBlackTree };
