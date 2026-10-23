(* Transposing and multiplying matrices represented as lists of rows. *)

fun transpose [] = []
  | transpose ([] :: _) = []
  | transpose rows = List.map hd rows :: transpose (List.map tl rows)

fun dot (xs, ys) = ListPair.foldl (fn (x, y, acc) => acc + x * y) 0 (xs, ys)

fun mmul (a, b) =
  let val cols = transpose b
  in List.map (fn row => List.map (fn col => dot (row, col)) cols) a end

fun showRow row = String.concatWith " " (List.map Int.toString row)
fun showMatrix m = List.app (fn r => print (showRow r ^ "\n")) m

val a = [[1, 2, 3], [4, 5, 6]]
val b = [[7, 8], [9, 10], [11, 12]]

val () = showMatrix (transpose a)
val () = print "--\n"
val () = showMatrix (mmul (a, b))
val () = print "--\n"
val () = showMatrix (transpose (transpose a))
