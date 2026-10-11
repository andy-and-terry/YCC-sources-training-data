object TreeFoldDemo {
  sealed trait Tree[+A]
  case object Leaf extends Tree[Nothing]
  case class Node[A](l: Tree[A], v: A, r: Tree[A]) extends Tree[A]

  def fold[A, B](t: Tree[A])(z: B)(f: (B, A, B) => B): B = t match {
    case Leaf => z
    case Node(l, v, r) => f(fold(l)(z)(f), v, fold(r)(z)(f))
  }

  def insert(t: Tree[Int], x: Int): Tree[Int] = t match {
    case Leaf => Node(Leaf, x, Leaf)
    case Node(l, v, r) =>
      if (x < v) Node(insert(l, x), v, r)
      else if (x > v) Node(l, v, insert(r, x))
      else t
  }

  def main(args: Array[String]): Unit = {
    val t = List(5, 3, 8, 1, 4, 7, 9).foldLeft(Leaf: Tree[Int])(insert)
    println(fold(t)(0)((a, _, b) => a + 1 + b))
    println(fold(t)(0)((a, v, b) => a + v + b))
    println(fold(t)(0)((a, _, b) => 1 + math.max(a, b)))
    println(fold(t)(List.empty[Int])((a, v, b) => a ++ List(v) ++ b))
  }
}
