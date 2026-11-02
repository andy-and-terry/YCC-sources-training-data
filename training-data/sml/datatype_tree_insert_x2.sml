datatype tree = Leaf | Node of tree * int * tree

fun insert (Leaf, x) = Node (Leaf, x, Leaf)
  | insert (Node (l, v, r), x) =
      if x < v then Node (insert (l, x), v, r)
      else Node (l, v, insert (r, x))

fun inorder Leaf = []
  | inorder (Node (l, v, r)) = inorder l @ [v] @ inorder r

val _ = print (String.concatWith " " (map Int.toString (inorder (foldl (fn (x, t) => insert (t, x)) Leaf [5, 2, 8, 1]))) ^ "\n")
