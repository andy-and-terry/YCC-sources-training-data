(* Tree traversals and flattening *)
datatype 'a tree = Leaf | Node of 'a tree * 'a * 'a tree

fun preorder Leaf = []
  | preorder (Node (l, x, r)) = x :: preorder l @ preorder r

fun inorder Leaf = []
  | inorder (Node (l, x, r)) = inorder l @ [x] @ inorder r

fun postorder Leaf = []
  | postorder (Node (l, x, r)) = postorder l @ postorder r @ [x]

fun height Leaf = 0
  | height (Node (l, _, r)) = 1 + Int.max (height l, height r)

val t = Node (Node (Node (Leaf, 1, Leaf), 2, Node (Leaf, 3, Leaf)), 4,
              Node (Leaf, 5, Leaf))

fun show xs = print (String.concatWith " " (map Int.toString xs) ^ "\n")
val () = show (preorder t)
val () = show (inorder t)
val () = show (postorder t)
val () = print (Int.toString (height t) ^ "\n")
