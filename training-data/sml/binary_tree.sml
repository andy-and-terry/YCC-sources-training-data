datatype tree = Leaf | Node of tree * int * tree

fun insert (Leaf, value) = Node (Leaf, value, Leaf)
  | insert (Node (l, v, r), value) =
      if value < v then Node (insert (l, value), v, r)
      else if value > v then Node (l, v, insert (r, value))
      else Node (l, v, r)

fun inorder Leaf = []
  | inorder (Node (l, v, r)) = inorder l @ [v] @ inorder r

val tree = foldl (fn (x, t) => insert (t, x)) Leaf [5, 3, 8, 1, 4, 7, 9]
val () = print (String.concatWith " " (map Int.toString (inorder tree)) ^ "\n")
