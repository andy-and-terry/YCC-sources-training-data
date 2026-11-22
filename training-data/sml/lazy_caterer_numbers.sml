(* Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1. *)
val out = List.tabulate (10, fn n => n * (n + 1) div 2 + 1)
val () = print (String.concatWith " " (map Int.toString out) ^ "\n")
