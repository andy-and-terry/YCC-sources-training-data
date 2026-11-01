(* Positive n expressible as a*a + b*b with a, b >= 0. *)
fun range (a, b) = if a > b then [] else a :: range (a + 1, b)

fun representable n =
  List.exists
    (fn a => List.exists (fn b => a * a + b * b = n) (range (a, 6)))
    (range (0, 6))

val out = List.filter representable (range (1, 30))
val () = print (String.concatWith " " (map Int.toString out) ^ "\n")
