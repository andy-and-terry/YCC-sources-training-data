(* Hexagonal numbers: n(2n-1). *)
val () =
  print (String.concatWith " "
    (List.tabulate (10, fn i => let val n = i + 1 in Int.toString (n * (2 * n - 1)) end)) ^ "\n")
