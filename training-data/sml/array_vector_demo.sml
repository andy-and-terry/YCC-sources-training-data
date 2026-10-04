val arr = Array.tabulate (6, fn i => i * 2)

val () = Array.update (arr, 0, 100)
val () = print (Int.toString (Array.sub (arr, 0)) ^ "\n")
val () = print (Int.toString (Array.length arr) ^ "\n")
val total = Array.foldl (op +) 0 arr
val () = print (Int.toString total ^ "\n")

fun reverseInPlace a =
  let
    fun swap (i, j) =
      if i >= j then ()
      else
        let val t = Array.sub (a, i)
        in Array.update (a, i, Array.sub (a, j));
           Array.update (a, j, t);
           swap (i + 1, j - 1)
        end
  in swap (0, Array.length a - 1) end

val () = reverseInPlace arr
val () = print (String.concatWith " " (map Int.toString (Array.foldr (op ::) [] arr)) ^ "\n")

val v = Vector.fromList [5, 3, 8]
val v2 = Vector.map (fn x => x + 1) v
val () = print (Int.toString (Vector.sub (v2, 2)) ^ "\n")
val () = print (Int.toString (Vector.foldl (op +) 0 v2) ^ "\n")

val counts = Array.array (3, 0)
val () = List.app (fn i => Array.update (counts, i, Array.sub (counts, i) + 1)) [0, 2, 2, 1, 2]
val () = print (String.concatWith "," (map Int.toString (Array.foldr (op ::) [] counts)) ^ "\n")
