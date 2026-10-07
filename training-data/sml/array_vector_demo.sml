val arr = Array.fromList [5, 3, 8, 1]

val () = Array.update (arr, 0, 50)
val () = print (Int.toString (Array.sub (arr, 0)) ^ "\n")
val () = print (Int.toString (Array.length arr) ^ "\n")

val sum = Array.foldl (op +) 0 arr
val () = print (Int.toString sum ^ "\n")

val () = Array.modify (fn x => x * 2) arr
val () = Array.app (fn x => print (Int.toString x ^ " ")) arr
val () = print "\n"

fun swap (a, i, j) =
  let val t = Array.sub (a, i)
  in Array.update (a, i, Array.sub (a, j)); Array.update (a, j, t) end

val () = swap (arr, 0, 3)
val () = print (String.concatWith "," (map Int.toString (Array.foldr (op ::) [] arr)) ^ "\n")

val v = Vector.fromList [1, 2, 3, 4]
val v2 = Vector.map (fn x => x * x) v
val () = print (Int.toString (Vector.foldl (op +) 0 v2) ^ "\n")
val () = print (Int.toString (Vector.sub (v2, 3)) ^ "\n")
val squares = Array.tabulate (5, fn i => i * i)
val () = print (Int.toString (Array.sub (squares, 4)) ^ "\n")
