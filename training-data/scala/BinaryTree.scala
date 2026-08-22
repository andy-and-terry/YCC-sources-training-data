class TreeNode(val value: Int) {
  var left: Option[TreeNode] = None
  var right: Option[TreeNode] = None
}

class BinaryTree {
  private var root: Option[TreeNode] = None

  def insert(value: Int): Unit = {
    root = Some(insertNode(root, value))
  }

  private def insertNode(node: Option[TreeNode], value: Int): TreeNode = node match {
    case None => new TreeNode(value)
    case Some(n) =>
      if (value < n.value) n.left = Some(insertNode(n.left, value))
      else n.right = Some(insertNode(n.right, value))
      n
  }

  def inorder(): List[Int] = {
    def traverse(node: Option[TreeNode]): List[Int] = node match {
      case None => Nil
      case Some(n) => traverse(n.left) ::: List(n.value) ::: traverse(n.right)
    }
    traverse(root)
  }
}

object BinaryTreeDemo {
  def main(args: Array[String]): Unit = {
    val tree = new BinaryTree
    List(5, 3, 8, 1, 4, 7, 9).foreach(tree.insert)
    println(tree.inorder())
  }
}
