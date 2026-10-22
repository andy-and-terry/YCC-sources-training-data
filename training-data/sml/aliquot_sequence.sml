fun properSum n =
  foldl op+ 0 (List.filter (fn d => n mod d = 0) (List.tabulate (n - 1, fn i => i + 1)))

fun aliquot 0 = [0]
  | aliquot n = n :: aliquot (properSum n)

val () =
  print (String.concatWith " " (map Int.toString (aliquot 12)) ^ "\n")
