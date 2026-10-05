fun sumTo n = List.foldl op+ 0 (List.tabulate (n + 1, fn i => i))

fun factorial n = List.foldl op* 1 (List.tabulate (n, fn i => i + 1))

val () = print (Int.toString (sumTo 100) ^ "\n")
val () = print (Int.toString (factorial 10) ^ "\n")

val () = print (String.concat (List.foldr (fn (x, acc) => Int.toString x :: acc) [] [1, 2, 3]) ^ "\n")
val () = print (String.concat (List.foldl (fn (x, acc) => Int.toString x :: acc) [] [1, 2, 3]) ^ "\n")

fun maxList (x :: xs) = List.foldl Int.max x xs
  | maxList [] = raise Empty

val () = print (Int.toString (maxList [3, 9, 2, 7]) ^ "\n")

val () = print (Int.toString (List.foldl (fn (x, n) => if x > 0 then n + 1 else n) 0 [~1, 2, 3, ~4]) ^ "\n")
val () = print (Real.fmt (StringCvt.FIX (SOME 2)) (List.foldl (op +) 0.0 [0.5, 1.25, 2.0] / 3.0) ^ "\n")
