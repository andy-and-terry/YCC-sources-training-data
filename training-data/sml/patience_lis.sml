fun insertTail (x, []) = [x]
  | insertTail (x, t :: ts) = if t >= x then x :: ts else t :: insertTail (x, ts)

fun lisLength xs = length (foldl insertTail [] xs)

val () = print (Int.toString (lisLength [10, 9, 2, 5, 3, 7, 101, 18]) ^ "\n")
