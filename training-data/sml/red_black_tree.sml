datatype color = Red | Black
datatype rbtree = Leaf | Node of color * rbtree * int * rbtree

fun balance (Black, Node (Red, Node (Red, a, x, b), y, c), z, d) =
      Node (Red, Node (Black, a, x, b), y, Node (Black, c, z, d))
  | balance (Black, Node (Red, a, x, Node (Red, b, y, c)), z, d) =
      Node (Red, Node (Black, a, x, b), y, Node (Black, c, z, d))
  | balance (Black, a, x, Node (Red, Node (Red, b, y, c), z, d)) =
      Node (Red, Node (Black, a, x, b), y, Node (Black, c, z, d))
  | balance (Black, a, x, Node (Red, b, y, Node (Red, c, z, d))) =
      Node (Red, Node (Black, a, x, b), y, Node (Black, c, z, d))
  | balance (color, a, x, b) = Node (color, a, x, b)

fun insert_helper (Leaf, x) = Node (Red, Leaf, x, Leaf)
  | insert_helper (Node (color, a, y, b), x) =
      if x < y then balance (color, insert_helper (a, x), y, b)
      else if x > y then balance (color, a, y, insert_helper (b, x))
      else Node (color, a, y, b)

fun insert (tree, x) =
  case insert_helper (tree, x) of
    Node (_, a, y, b) => Node (Black, a, y, b)
  | Leaf => Leaf

fun member (Leaf, _) = false
  | member (Node (_, a, y, b), x) =
      if x < y then member (a, x)
      else if x > y then member (b, x)
      else true

fun inorder Leaf = []
  | inorder (Node (_, a, x, b)) = inorder a @ [x] @ inorder b

val tree = List.foldl (fn (x, t) => insert (t, x)) Leaf [10, 20, 30, 15, 5, 25]
val () = print (String.concatWith " " (map Int.toString (inorder tree)) ^ "\n")
val () = print (Bool.toString (member (tree, 15)) ^ "\n")
val () = print (Bool.toString (member (tree, 99)) ^ "\n")
