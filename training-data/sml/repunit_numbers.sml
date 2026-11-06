(* Repunits: numbers made only of the digit 1. *)
fun repunits 0 _ = []
  | repunits n r = let val next = r * 10 + 1 in next :: repunits (n - 1) next end

val () = print (String.concatWith " " (map Int.toString (repunits 5 0)) ^ "\n")
