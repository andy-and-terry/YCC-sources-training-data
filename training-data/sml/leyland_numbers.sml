(* Leyland numbers: x^y + y^x for x >= y >= 2. *)
fun ipow (_, 0) = 1
  | ipow (b, e) = b * ipow (b, e - 1)

fun leyland (x, y) = ipow (x, y) + ipow (y, x)

fun range (a, b) = if a > b then [] else a :: range (a + 1, b)

val vals = List.concat (map (fn x => map (fn y => leyland (x, y)) (range (2, x))) (range (2, 4)))
val () = print (String.concatWith " " (map Int.toString vals) ^ "\n")
