fun sigma n =
  foldl (fn (d, s) => if n mod d = 0 then s + d else s) 0 (List.tabulate (n, fn i => i + 1))

val ds = List.filter (fn n => sigma n < 2 * n) (List.tabulate (20, fn i => i + 1))

val () = print (String.concatWith " " (map Int.toString ds) ^ "\n")
