(* Pronic numbers n(n+1) *)
fun term n = n * (n + 1)

val () = print (String.concatWith " " (List.map (Int.toString o term) (List.tabulate (10, fn i => i))) ^ "\n")
