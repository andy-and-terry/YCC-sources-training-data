(* Tetrahedral numbers n(n+1)(n+2)/6 *)
fun term n = ((n * (n + 1)) * (n + 2)) div 6

val () = print (String.concatWith " " (List.map (Int.toString o term) (List.tabulate (10, fn i => i))) ^ "\n")
