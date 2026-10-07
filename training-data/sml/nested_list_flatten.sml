datatype 'a nested = Leaf of 'a | Node of 'a nested list

fun flatten (Leaf x) = [x]
  | flatten (Node children) = List.concat (map flatten children)

fun depth (Leaf _) = 0
  | depth (Node []) = 1
  | depth (Node cs) = 1 + foldl Int.max 0 (map depth cs)

fun mapNested f (Leaf x) = Leaf (f x)
  | mapNested f (Node cs) = Node (map (mapNested f) cs)

val tree = Node [Leaf 1, Node [Leaf 2, Node [Leaf 3, Leaf 4]], Node [], Leaf 5]

fun show l = String.concatWith " " (map Int.toString l)

val () = print (show (flatten tree) ^ "\n")
val () = print (Int.toString (depth tree) ^ "\n")
val () = print (show (flatten (mapNested (fn x => x * 10) tree)) ^ "\n")
