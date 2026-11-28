fun chebyshev (a, b) =
  ListPair.foldl (fn (x, y, m) => Int.max (m, abs (x - y))) 0 (a, b)

val () = print (Int.toString (chebyshev ([1, 2], [4, 6])) ^ "\n")
