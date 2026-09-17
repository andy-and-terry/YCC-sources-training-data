fun hanoi (0, _, _, _) = []
  | hanoi (n, from, to, via) =
      hanoi (n - 1, from, via, to) @ [(from, to)] @ hanoi (n - 1, via, to, from)

fun move_to_string (from, to) = from ^ " -> " ^ to

val moves = hanoi (3, "A", "C", "B")
val () = print (String.concatWith ", " (map move_to_string moves) ^ "\n")
val () = print (Int.toString (length moves) ^ "\n")
