class Node<T> {
  left: Node<T> | null = null;
  right: Node<T> | null = null;
  constructor(public value: T) {}
}

class BinaryTree<T> {
  private root: Node<T> | null = null;

  constructor(private compare: (a: T, b: T) => number) {}

  insert(value: T): void {
    this.root = this.insertNode(this.root, value);
  }

  private insertNode(node: Node<T> | null, value: T): Node<T> {
    if (!node) return new Node(value);
    if (this.compare(value, node.value) < 0) node.left = this.insertNode(node.left, value);
    else node.right = this.insertNode(node.right, value);
    return node;
  }

  inOrder(): T[] {
    const result: T[] = [];
    this.inOrderVisit(this.root, result);
    return result;
  }

  private inOrderVisit(node: Node<T> | null, result: T[]): void {
    if (!node) return;
    this.inOrderVisit(node.left, result);
    result.push(node.value);
    this.inOrderVisit(node.right, result);
  }
}

const tree = new BinaryTree<number>((a, b) => a - b);
[5, 3, 8, 1, 4, 7, 9].forEach((v) => tree.insert(v));
console.log(tree.inOrder());
