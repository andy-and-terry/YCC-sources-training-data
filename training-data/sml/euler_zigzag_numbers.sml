(* Euler zigzag numbers via the Seidel-Entringer boustrophedon. *)
fun step row =
  rev (foldl (fn (x, acc as h :: _) => (h + x) :: acc | (_, []) => []) [0] (rev row))

fun zigzag (0, _) = []
  | zigzag (k, row) = List.last row :: zigzag (k - 1, step row)

val () = print (String.concatWith " " (map Int.toString (zigzag (10, [1]))) ^ "\n")
