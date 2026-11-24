(* Moser-de Bruijn sequence: binary digits of n read in base 4. *)
fun moser 0 = 0
  | moser n = (n mod 2) + 4 * moser (n div 2)

val () = print (String.concatWith " " (List.tabulate (12, fn n => Int.toString (moser n))) ^ "\n")
