val v1 = Vector.tabulate (5, fn i => i * i)

val v2 = Vector.map (fn x => x + 1) v1

val total = Vector.foldl (op +) 0 v2

val () = print (String.concatWith " " (map Int.toString (Vector.foldr (op ::) [] v2)) ^ "\n")
val () = print (Int.toString total ^ "\n")
val () = print (Int.toString (Vector.sub (v1, 3)) ^ "\n")
