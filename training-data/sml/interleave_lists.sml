fun interleave ([], ys) = ys
  | interleave (xs, []) = xs
  | interleave (x :: xs, y :: ys) = x :: y :: interleave (xs, ys)

val () = print (String.implode (interleave (String.explode "abc", String.explode "12345")) ^ "\n")
