class AVLNode {
  int value;
  AVLNode? left;
  AVLNode? right;
  int height = 1;
  AVLNode(this.value);
}

int _height(AVLNode? node) => node == null ? 0 : node.height;

int _balanceFactor(AVLNode? node) =>
    node == null ? 0 : _height(node.left) - _height(node.right);

void _updateHeight(AVLNode node) {
  node.height = 1 + (_height(node.left) > _height(node.right) ? _height(node.left) : _height(node.right));
}

AVLNode _rotateRight(AVLNode y) {
  final x = y.left!;
  final t2 = x.right;
  x.right = y;
  y.left = t2;
  _updateHeight(y);
  _updateHeight(x);
  return x;
}

AVLNode _rotateLeft(AVLNode x) {
  final y = x.right!;
  final t2 = y.left;
  y.left = x;
  x.right = t2;
  _updateHeight(x);
  _updateHeight(y);
  return y;
}

AVLNode insert(AVLNode? node, int value) {
  if (node == null) return AVLNode(value);

  if (value < node.value) {
    node.left = insert(node.left, value);
  } else if (value > node.value) {
    node.right = insert(node.right, value);
  } else {
    return node;
  }

  _updateHeight(node);
  final balance = _balanceFactor(node);

  if (balance > 1 && value < node.left!.value) return _rotateRight(node);
  if (balance < -1 && value > node.right!.value) return _rotateLeft(node);
  if (balance > 1 && value > node.left!.value) {
    node.left = _rotateLeft(node.left!);
    return _rotateRight(node);
  }
  if (balance < -1 && value < node.right!.value) {
    node.right = _rotateRight(node.right!);
    return _rotateLeft(node);
  }

  return node;
}

void inorder(AVLNode? node, List<int> result) {
  if (node == null) return;
  inorder(node.left, result);
  result.add(node.value);
  inorder(node.right, result);
}

void main() {
  AVLNode? root;
  for (final v in [10, 20, 30, 40, 50, 25]) {
    root = insert(root, v);
  }
  final result = <int>[];
  inorder(root, result);
  print(result);
  print(_height(root));
}
