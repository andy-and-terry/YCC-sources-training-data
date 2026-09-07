class AVLNode {
  value: number;
  height: number;
  left: AVLNode | null = null;
  right: AVLNode | null = null;

  constructor(value: number) {
    this.value = value;
    this.height = 1;
  }
}

class AVLTree {
  private root: AVLNode | null = null;

  insert(value: number): void {
    this.root = this.insertNode(this.root, value);
  }

  private height(node: AVLNode | null): number {
    return node ? node.height : 0;
  }

  private balanceFactor(node: AVLNode): number {
    return this.height(node.left) - this.height(node.right);
  }

  private updateHeight(node: AVLNode): void {
    node.height = 1 + Math.max(this.height(node.left), this.height(node.right));
  }

  private rotateRight(y: AVLNode): AVLNode {
    const x = y.left!;
    y.left = x.right;
    x.right = y;
    this.updateHeight(y);
    this.updateHeight(x);
    return x;
  }

  private rotateLeft(x: AVLNode): AVLNode {
    const y = x.right!;
    x.right = y.left;
    y.left = x;
    this.updateHeight(x);
    this.updateHeight(y);
    return y;
  }

  private insertNode(node: AVLNode | null, value: number): AVLNode {
    if (!node) return new AVLNode(value);
    if (value < node.value) node.left = this.insertNode(node.left, value);
    else if (value > node.value) node.right = this.insertNode(node.right, value);
    else return node;

    this.updateHeight(node);
    const balance = this.balanceFactor(node);

    if (balance > 1 && value < node.left!.value) return this.rotateRight(node);
    if (balance < -1 && value > node.right!.value) return this.rotateLeft(node);
    if (balance > 1 && value > node.left!.value) {
      node.left = this.rotateLeft(node.left!);
      return this.rotateRight(node);
    }
    if (balance < -1 && value < node.right!.value) {
      node.right = this.rotateRight(node.right!);
      return this.rotateLeft(node);
    }
    return node;
  }

  inorder(): number[] {
    const result: number[] = [];
    const walk = (node: AVLNode | null): void => {
      if (!node) return;
      walk(node.left);
      result.push(node.value);
      walk(node.right);
    };
    walk(this.root);
    return result;
  }

  heightOfTree(): number {
    return this.height(this.root);
  }
}

const tree = new AVLTree();
[10, 20, 30, 40, 50, 25].forEach((v) => tree.insert(v));
console.log(tree.inorder());
console.log(tree.heightOfTree());
