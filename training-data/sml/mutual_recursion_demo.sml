fun is_even 0 = true
  | is_even n = is_odd (n - 1)
and is_odd 0 = false
  | is_odd n = is_even (n - 1)

datatype tree = Leaf of int | Node of tree list

fun sum_tree (Leaf n) = n
  | sum_tree (Node children) = sum_forest children
and sum_forest [] = 0
  | sum_forest (t :: ts) = sum_tree t + sum_forest ts

val () = print (Bool.toString (is_even 10) ^ "\n")
val () = print (Bool.toString (is_odd 7) ^ "\n")

val t = Node [Leaf 1, Node [Leaf 2, Leaf 3], Leaf 4]
val () = print (Int.toString (sum_tree t) ^ "\n")
