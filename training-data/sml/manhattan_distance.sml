(* Manhattan distance. *)
fun manhattan (a, b) = ListPair.foldl (fn (x, y, s) => s + abs (x - y)) 0 (a, b)
val _ = print (Int.toString (manhattan ([1, 2], [4, 6])) ^ "\n")
