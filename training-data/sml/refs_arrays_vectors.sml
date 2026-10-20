val r = ref 10
val _ = r := !r + 5
val _ = print (Int.toString (!r) ^ "\n")
val a = Array.array (5, 0)
val _ = Array.modify (fn _ => 1) a
val _ = Array.update (a, 2, 99)
val _ = print (String.concatWith "," (map Int.toString (Array.foldr (op::) [] a)) ^ "\n")
val v = Vector.fromList [3, 1, 2]
val _ = print (Int.toString (Vector.foldl op+ 0 v) ^ " " ^ Int.toString (Vector.length v) ^ " " ^ Int.toString (Vector.sub (v, 1)) ^ "\n")
val v2 = Vector.map (fn x => x * x) v
val _ = print (String.concatWith "," (Vector.foldr (fn (x, acc) => Int.toString x :: acc) [] v2) ^ "\n")
val arr = Array.tabulate (6, fn i => i * i)
val _ = print (Int.toString (Array.foldl Int.max 0 arr) ^ "\n")
fun swap (arr, i, j) = let val t = Array.sub (arr, i) in (Array.update (arr, i, Array.sub (arr, j)); Array.update (arr, j, t)) end
val _ = swap (arr, 0, 5)
val _ = print (Int.toString (Array.sub (arr, 0)) ^ " " ^ Int.toString (Array.sub (arr, 5)) ^ "\n")
val total = ref 0
val _ = Array.app (fn x => total := !total + x) arr
val _ = print (Int.toString (!total) ^ "\n")
val _ = while !total > 50 do total := !total - 20
val _ = print (Int.toString (!total) ^ "\n")
