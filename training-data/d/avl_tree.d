import std.stdio;
import std.algorithm : max;

class AVLNode {
    int value;
    AVLNode left, right;
    int height = 1;
    this(int value) { this.value = value; }
}

int height(AVLNode node) {
    return node is null ? 0 : node.height;
}

int balanceFactor(AVLNode node) {
    return node is null ? 0 : height(node.left) - height(node.right);
}

void updateHeight(AVLNode node) {
    node.height = 1 + max(height(node.left), height(node.right));
}

AVLNode rotateRight(AVLNode y) {
    auto x = y.left;
    auto t2 = x.right;
    x.right = y;
    y.left = t2;
    updateHeight(y);
    updateHeight(x);
    return x;
}

AVLNode rotateLeft(AVLNode x) {
    auto y = x.right;
    auto t2 = y.left;
    y.left = x;
    x.right = t2;
    updateHeight(x);
    updateHeight(y);
    return y;
}

AVLNode insert(AVLNode node, int value) {
    if (node is null) return new AVLNode(value);

    if (value < node.value) node.left = insert(node.left, value);
    else if (value > node.value) node.right = insert(node.right, value);
    else return node;

    updateHeight(node);
    int balance = balanceFactor(node);

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

void inorder(AVLNode node, ref int[] result) {
    if (node is null) return;
    inorder(node.left, result);
    result ~= node.value;
    inorder(node.right, result);
}

void main() {
    AVLNode root;
    foreach (v; [10, 20, 30, 40, 50, 25]) root = insert(root, v);
    int[] result;
    inorder(root, result);
    writeln(result);
    writeln(height(root));
}
