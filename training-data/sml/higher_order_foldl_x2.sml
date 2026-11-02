val sumSquares = foldl (fn (x, a) => a + x * x) 0
val _ = print (Int.toString (sumSquares [1, 2, 3]) ^ "\n")
