fun transpose [] = []
  | transpose ([] :: _) = []
  | transpose matrix = map hd matrix :: transpose (map tl matrix)

fun multiply (a, b) =
  let
    val bt = transpose b
  in
    map (fn row => map (fn col => foldl (op +) 0 (ListPair.map (op *) (row, col))) bt) a
  end

val a = [[1, 2], [3, 4]]
val b = [[5, 6], [7, 8]]
val () = print (String.concatWith "; " (map (String.concatWith " " o map Int.toString) (multiply (a, b))) ^ "\n")
