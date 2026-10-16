fun comparePair (cmpA, cmpB) ((a1, b1), (a2, b2)) =
  case cmpA (a1, a2) of
    EQUAL => cmpB (b1, b2)
  | other => other

val cmp = comparePair (String.compare, Int.compare)

fun show LESS = "LESS" | show EQUAL = "EQUAL" | show GREATER = "GREATER"

val () = print (show (cmp (("a", 2), ("a", 5))) ^ "\n")
val () = print (show (cmp (("b", 1), ("a", 9))) ^ "\n")
val () = print (show (cmp (("c", 3), ("c", 3))) ^ "\n")
