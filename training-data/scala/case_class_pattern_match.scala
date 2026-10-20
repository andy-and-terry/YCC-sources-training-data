sealed trait Tree
case class Leaf(v: Int) extends Tree
case class Node(l: Tree, r: Tree) extends Tree

object Main extends App {
  def sum(t: Tree): Int = t match {
    case Leaf(v)    => v
    case Node(l, r) => sum(l) + sum(r)
  }
  println(sum(Node(Leaf(1), Node(Leaf(2), Leaf(3)))))
}
