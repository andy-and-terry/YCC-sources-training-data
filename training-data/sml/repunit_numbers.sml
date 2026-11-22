(* Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1. *)
fun repunits (0, _) = []
  | repunits (k, r) = r :: repunits (k - 1, r * 10 + 1)

val () = print (String.concatWith " " (map Int.toString (repunits (8, 1))) ^ "\n")
