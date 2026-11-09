fun find (_, []) = NONE
  | find (p, x :: xs) = if p x then SOME x else find (p, xs)

val _ = case find (fn x => x > 3, [1, 2, 5, 7]) of
            SOME v => print (Int.toString v ^ "\n")
          | NONE => print "none\n"
