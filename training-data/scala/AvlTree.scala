class AvlNode(val value: Int) {
  var left: Option[AvlNode] = None
  var right: Option[AvlNode] = None
  var height: Int = 1
}

object AvlTree {
  def height(node: Option[AvlNode]): Int = node.map(_.height).getOrElse(0)

  def updateHeight(node: AvlNode): Unit = {
    node.height = 1 + math.max(height(node.left), height(node.right))
  }

  def balanceFactor(node: AvlNode): Int = height(node.left) - height(node.right)

  def rotateRight(node: AvlNode): AvlNode = {
    val newRoot = node.left.get
    node.left = newRoot.right
    updateHeight(node)
    newRoot.right = Some(node)
    updateHeight(newRoot)
    newRoot
  }

  def rotateLeft(node: AvlNode): AvlNode = {
    val newRoot = node.right.get
    node.right = newRoot.left
    updateHeight(node)
    newRoot.left = Some(node)
    updateHeight(newRoot)
    newRoot
  }

  def rebalance(node: AvlNode): AvlNode = {
    updateHeight(node)
    val bf = balanceFactor(node)
    if (bf > 1) {
      if (balanceFactor(node.left.get) < 0) {
        node.left = Some(rotateLeft(node.left.get))
      }
      rotateRight(node)
    } else if (bf < -1) {
      if (balanceFactor(node.right.get) > 0) {
        node.right = Some(rotateRight(node.right.get))
      }
      rotateLeft(node)
    } else {
      node
    }
  }

  def insert(node: Option[AvlNode], value: Int): AvlNode = node match {
    case None => new AvlNode(value)
    case Some(n) =>
      if (value < n.value) n.left = Some(insert(n.left, value))
      else if (value > n.value) n.right = Some(insert(n.right, value))
      rebalance(n)
  }

  def inorder(node: Option[AvlNode]): List[Int] = node match {
    case None => Nil
    case Some(n) => inorder(n.left) ::: List(n.value) ::: inorder(n.right)
  }

  def main(args: Array[String]): Unit = {
    var root: Option[AvlNode] = None
    for (v <- List(10, 20, 30, 40, 50, 25)) {
      root = Some(insert(root, v))
    }
    println(inorder(root))
    println(height(root))
  }
}
