fun transpose [] = []
  | transpose ([] :: _) = []
  | transpose rows = map hd rows :: transpose (map tl rows)

fun spiral [] = []
  | spiral (first :: rest) = first @ spiral (rev (transpose rest))

val grid = [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]

val () = print (String.concatWith " " (map Int.toString (spiral grid)) ^ "\n")
val () = print (String.concatWith " " (map Int.toString (spiral [[1, 2], [3, 4]])) ^ "\n")
