fun hanoi 0 _ _ _ = []
  | hanoi n a b c = hanoi (n - 1) a c b @ [(a, c)] @ hanoi (n - 1) b a c

val moves = hanoi 3 "A" "B" "C"
val () = print (Int.toString (length moves) ^ ": " ^
                String.concatWith " " (map (fn (x, y) => x ^ "->" ^ y) moves) ^ "\n")
