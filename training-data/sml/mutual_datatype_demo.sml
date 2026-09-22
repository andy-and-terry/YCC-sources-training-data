datatype 'a tree = Node of 'a * 'a forest
and 'a forest = Forest of 'a tree list

fun leaf x = Node (x, Forest [])

fun sizeTree (Node (_, f)) = 1 + sizeForest f
and sizeForest (Forest ts) = List.foldl (fn (t, acc) => acc + sizeTree t) 0 ts

fun sumTree (Node (x, f)) = x + sumForest f
and sumForest (Forest ts) = List.foldl (fn (t, acc) => acc + sumTree t) 0 ts

val sample = Node (1, Forest [leaf 2, leaf 3, Node (4, Forest [leaf 5])])

val () = print ("size: " ^ Int.toString (sizeTree sample) ^ "\n")
val () = print ("sum: " ^ Int.toString (sumTree sample) ^ "\n")
