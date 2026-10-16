fun interleave ([], ys) = ys
  | interleave (xs, []) = xs
  | interleave (x :: xs, y :: ys) = x :: y :: interleave (xs, ys)

val result = interleave ([1,3,5,7], [2,4])
val () = print (String.concatWith " " (map Int.toString result) ^ "\n")
