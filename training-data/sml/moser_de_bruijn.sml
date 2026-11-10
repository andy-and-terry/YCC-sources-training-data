(* Read the binary digits of i as base-4 digits. *)
fun moser 0 = 0
  | moser i = (i mod 2) + 4 * moser (i div 2)

val () = print (String.concatWith " " (List.tabulate (10, fn i => Int.toString (moser i))) ^ "\n")
(* 0 1 4 5 16 17 20 21 64 65 *)
