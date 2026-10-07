(* Immutable vectors *)
val v = Vector.fromList [10, 20, 30, 40]
val doubled = Vector.map (fn x => x * 2) v
val total = Vector.foldl op+ 0 v

fun toList vec = Vector.foldr (op ::) [] vec
fun show vec = print (String.concatWith " " (map Int.toString (toList vec)) ^ "\n")

val () = show doubled
val () = print (Int.toString total ^ "\n")
val () = print (Int.toString (Vector.sub (v, 2)) ^ "\n")
val () = show (Vector.tabulate (5, fn i => i + 1))
val () = show (Vector.concat [v, doubled])
