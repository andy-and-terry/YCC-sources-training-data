class AVLNode(val value: Int) {
  var left: Option[AVLNode] = None
  var right: Option[AVLNode] = None
  var height: Int = 1
}

class AVLTree {
  private var root: Option[AVLNode] = None

  private def height(node: Option[AVLNode]): Int = node.map(_.height).getOrElse(0)

  private def balanceFactor(node: AVLNode): Int = height(node.left) - height(node.right)

  private def updateHeight(node: AVLNode): Unit = {
    node.height = 1 + math.max(height(node.left), height(node.right))
  }

  private def rotateRight(node: AVLNode): AVLNode = {
    val newRoot = node.left.get
    node.left = newRoot.right
    newRoot.right = Some(node)
    updateHeight(node)
    updateHeight(newRoot)
    newRoot
  }

  private def rotateLeft(node: AVLNode): AVLNode = {
    val newRoot = node.right.get
    node.right = newRoot.left
    newRoot.left = Some(node)
    updateHeight(node)
    updateHeight(newRoot)
    newRoot
  }

  private def rebalance(node: AVLNode, value: Int): AVLNode = {
    updateHeight(node)
    val balance = balanceFactor(node)

    if (balance > 1 && value < node.left.get.value) rotateRight(node)
    else if (balance < -1 && value > node.right.get.value) rotateLeft(node)
    else if (balance > 1 && value > node.left.get.value) {
      node.left = Some(rotateLeft(node.left.get))
      rotateRight(node)
    } else if (balance < -1 && value < node.right.get.value) {
      node.right = Some(rotateRight(node.right.get))
      rotateLeft(node)
    } else node
  }

  private def insertNode(node: Option[AVLNode], value: Int): AVLNode = node match {
    case None => new AVLNode(value)
    case Some(n) =>
      if (value < n.value) {
        n.left = Some(insertNode(n.left, value))
        rebalance(n, value)
      } else if (value > n.value) {
        n.right = Some(insertNode(n.right, value))
        rebalance(n, value)
      } else n
  }

  def insert(value: Int): Unit = {
    root = Some(insertNode(root, value))
  }

  def inorder(): List[Int] = {
    def traverse(node: Option[AVLNode]): List[Int] = node match {
      case None => Nil
      case Some(n) => traverse(n.left) ::: List(n.value) ::: traverse(n.right)
    }
    traverse(root)
  }

  def treeHeight(): Int = height(root)
}

object AVLTreeDemo {
  def main(args: Array[String]): Unit = {
    val tree = new AVLTree
    List(10, 20, 30, 40, 50, 25).foreach(tree.insert)
    println(tree.inorder())
    println(tree.treeHeight())
  }
}
