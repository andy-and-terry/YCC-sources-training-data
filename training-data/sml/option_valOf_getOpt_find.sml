fun find (_, []) = NONE
  | find (p, x :: xs) = if p x then SOME x else find (p, xs)

val a = find (fn x => x > 3, [1, 2, 5, 7])
val b = find (fn x => x > 10, [1, 2, 5])
val _ = print (Int.toString (getOpt (a, ~1)) ^ " " ^ Int.toString (getOpt (b, ~1)) ^ "\n")
