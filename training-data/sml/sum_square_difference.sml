(* Square of the sum minus sum of squares for 1..10 (expect 2640) *)
val xs = List.tabulate (10, fn i => i + 1)
val total = foldl op+ 0 xs
val squares = foldl (fn (x, a) => a + x * x) 0 xs
val () = print (Int.toString (total * total - squares) ^ "\n")
