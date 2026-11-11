(* Population count (number of set bits) for 0..15 *)
fun bits 0 = 0
  | bits n = (n mod 2) + bits (n div 2)

val () = print (String.concatWith " " (List.map (Int.toString o bits) (List.tabulate (16, fn i => i))) ^ "\n")
