val arr = Array.fromList [5, 3, 8, 1]

val () = Array.update (arr, 0, 50)
val () = print (Int.toString (Array.sub (arr, 0)) ^ "\n")
val () = print (Int.toString (Array.length arr) ^ "\n")
val total = Array.foldl op+ 0 arr
val () = print (Int.toString total ^ "\n")

val () = Array.modify (fn x => x * 2) arr
val () = Array.app (fn x => print (Int.toString x ^ " ")) arr
val () = print "\n"

val v = Vector.fromList [1, 2, 3]
val v2 = Vector.map (fn x => x * x) v
val () = print (Int.toString (Vector.foldl op+ 0 v2) ^ "\n")
val () = print (Int.toString (Vector.length v) ^ "\n")

val grid = Array.tabulate (3, fn i => Array.tabulate (3, fn j => i * j))
val () = print (Int.toString (Array.sub (Array.sub (grid, 2), 2)) ^ "\n")
val big = Array.array (4, 0)
val () = Array.appi (fn (i, _) => Array.update (big, i, i * 10)) big
val () = print (Int.toString (Array.sub (big, 3)) ^ "\n")
