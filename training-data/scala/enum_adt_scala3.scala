enum Tree[+T]:
  case Leaf
  case Node(l: Tree[T], v: T, r: Tree[T])

def size[T](t: Tree[T]): Int = t match
  case Tree.Leaf => 0
  case Tree.Node(l, _, r) => size(l) + 1 + size(r)

@main def sizeDemo(): Unit =
  println(size(Tree.Node(Tree.Leaf, 1, Tree.Node(Tree.Leaf, 2, Tree.Leaf))))
