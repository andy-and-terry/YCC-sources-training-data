fun find p [] = NONE
  | find p (x :: xs) = if p x then SOME x else find p xs

val _ = case find (fn x => x > 2) [1, 2, 3, 4] of
            SOME v => print (Int.toString v ^ "\n")
          | NONE => print "none\n"
