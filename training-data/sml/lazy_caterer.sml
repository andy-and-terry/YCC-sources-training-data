(* Lazy caterer sequence: max pieces from n cuts *)
fun term n = ((n * (n + 1)) div 2) + 1

val () = print (String.concatWith " " (List.map (Int.toString o term) (List.tabulate (10, fn i => i))) ^ "\n")
