fun f (0, _) = "zero"
  | f (_, (a, b)) = if a = b then "same" else "diff"
val _ = print (f (0, (1, 2)) ^ f (1, (3, 3)) ^ f (1, (3, 4)) ^ "\n")
