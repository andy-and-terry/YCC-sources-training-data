fun makePrefix vals =
  Vector.fromList (rev (foldl (fn (v, acc as h :: _) => (h + v) :: acc | (_, []) => []) [0] vals))

fun query p lo hi = Vector.sub (p, hi) - Vector.sub (p, lo)

val () = print (Int.toString (query (makePrefix [3, 1, 4, 1, 5, 9, 2, 6]) 2 5) ^ "\n")
