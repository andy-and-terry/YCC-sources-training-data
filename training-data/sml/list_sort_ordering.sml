val words = ["pear", "fig", "banana", "kiwi", "apple"]

fun byLength (a, b) = Int.compare (String.size a, String.size b)

fun insert cmp (x, []) = [x]
  | insert cmp (x, y :: ys) =
      if cmp (x, y) = GREATER then y :: insert cmp (x, ys) else x :: y :: ys

fun sortBy cmp xs = foldl (insert cmp) [] xs

val () = print (String.concatWith " " (sortBy byLength words) ^ "\n")
val () = print (String.concatWith " " (sortBy String.compare words) ^ "\n")
