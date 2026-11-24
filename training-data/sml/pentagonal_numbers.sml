(* Pentagonal numbers: n(3n-1)/2. *)
val () =
  print (String.concatWith " "
    (List.tabulate (10, fn i => let val n = i + 1 in Int.toString (n * (3 * n - 1) div 2) end)) ^ "\n")
