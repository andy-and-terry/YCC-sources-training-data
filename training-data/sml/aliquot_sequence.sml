(* Aliquot sequence: replace n by the sum of its proper divisors. *)
fun aliquotSum n =
  let fun loop (d, s) = if d > n div 2 then s else loop (d + 1, if n mod d = 0 then s + d else s)
  in loop (1, 0) end

fun aliquot (n, count) =
  if n <= 1 orelse count >= 19 then [n] else n :: aliquot (aliquotSum n, count + 1)

val () = print (String.concatWith " " (map Int.toString (aliquot (12, 0))) ^ "\n")
