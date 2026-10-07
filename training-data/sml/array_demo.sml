(* Mutable arrays from the Basis Library *)
val arr = Array.fromList [5, 3, 8, 1]

fun sumArray a = Array.foldl op+ 0 a

fun reverseInPlace a =
  let
    val n = Array.length a
    fun swap (i, j) =
      let val t = Array.sub (a, i)
      in Array.update (a, i, Array.sub (a, j)); Array.update (a, j, t) end
    fun loop i = if i >= n - 1 - i then () else (swap (i, n - 1 - i); loop (i + 1))
  in loop 0 end

val () = print (Int.toString (sumArray arr) ^ "\n")
val () = reverseInPlace arr
val () = print (String.concatWith " " (map Int.toString (Array.foldr (op ::) [] arr)) ^ "\n")
val squares = Array.tabulate (5, fn i => i * i)
val () = Array.modify (fn x => x + 1) squares
val () = print (String.concatWith " " (map Int.toString (Array.foldr (op ::) [] squares)) ^ "\n")
