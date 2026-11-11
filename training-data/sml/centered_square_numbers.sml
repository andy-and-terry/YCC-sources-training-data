(* Centered square numbers 2n(n+1)+1 *)
fun term n = ((2 * n) * (n + 1)) + 1

val () = print (String.concatWith " " (List.map (Int.toString o term) (List.tabulate (10, fn i => i))) ^ "\n")
