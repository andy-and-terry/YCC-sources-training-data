val squares = List.tabulate (10, fn i => (i + 1) * (i + 1))
val total = foldl op+ 0 squares
val evens = List.filter (fn x => x mod 2 = 0) squares

val () = print ("sum of squares 1..10 = " ^ Int.toString total ^ "\n")
val () = print ("even squares: " ^ String.concatWith "," (map Int.toString evens) ^ "\n")
