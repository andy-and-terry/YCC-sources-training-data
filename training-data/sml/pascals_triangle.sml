fun nextRow row = 1 :: (ListPair.map (op +) (row, tl row) @ [1])

fun triangle 0 = [[1]]
  | triangle n =
      let val prev = triangle (n - 1) in prev @ [nextRow (List.last prev)] end

val () = app (fn row => print (String.concatWith " " (map Int.toString row) ^ "\n")) (triangle 5)
