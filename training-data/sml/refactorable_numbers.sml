fun tau n = length (List.filter (fn d => n mod d = 0) (List.tabulate (n, fn i => i + 1)))

val result = List.filter (fn n => n mod tau n = 0) (List.tabulate (59, fn i => i + 1))
val () = print (String.concatWith " " (map Int.toString result) ^ "\n")
(* 1 2 8 9 12 18 24 36 40 56 *)
