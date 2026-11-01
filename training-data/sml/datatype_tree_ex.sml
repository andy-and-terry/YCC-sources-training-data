datatype 'a tree = Leaf | Node of 'a tree * 'a * 'a tree

fun insert (x, Leaf) = Node (Leaf, x, Leaf)
  | insert (x, Node (l, v, r)) =
      if x < v then Node (insert (x, l), v, r) else Node (l, v, insert (x, r))

fun inorder Leaf = []
  | inorder (Node (l, v, r)) = inorder l @ [v] @ inorder r

val () = print (String.concatWith "," (map Int.toString (inorder (foldl insert Leaf [5, 2, 8, 1]))) ^ "\n")
