fun sigma n = foldl op+ 0 (List.filter (fn d => n mod d = 0) (List.tabulate (n, fn i => i + 1)))

val result = List.filter (fn n => sigma (sigma n) = 2 * n) (List.tabulate (99, fn i => i + 1))
val () = print (String.concatWith " " (map Int.toString result) ^ "\n")
(* 2 4 16 64 *)
