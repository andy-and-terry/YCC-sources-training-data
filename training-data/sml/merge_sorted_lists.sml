(* Merge two sorted lists, then k-way by folding *)
fun merge ([], ys) = ys
  | merge (xs, []) = xs
  | merge (x :: xs, y :: ys) =
      if x <= y then x :: merge (xs, y :: ys) else y :: merge (x :: xs, ys)

fun mergeAll lists = List.foldl (fn (l, acc) => merge (acc, l)) [] lists

val () = print (String.concatWith " " (map Int.toString (merge ([1, 4, 7], [2, 3, 9]))) ^ "\n")
val () = print (String.concatWith " " (map Int.toString (mergeAll [[1, 5], [2, 6], [0, 9]])) ^ "\n")
