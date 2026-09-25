fun interleave (x, []) = [[x]]
  | interleave (x, y :: ys) = (x :: y :: ys) :: map (fn l => y :: l) (interleave (x, ys))

fun permutations [] = [[]]
  | permutations (x :: xs) = List.concat (map (fn p => interleave (x, p)) (permutations xs))

val () =
  app
    (fn p => print (String.concatWith " " (map Int.toString p) ^ "\n"))
    (permutations [1, 2, 3])
