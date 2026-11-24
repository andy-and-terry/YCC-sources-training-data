(* Centered square numbers: n^2 + (n+1)^2. *)
val () =
  print (String.concatWith " "
    (List.tabulate (10, fn n => Int.toString (n * n + (n + 1) * (n + 1)))) ^ "\n")
