val xs = [3, 8, 1, 9, 4, 7]

fun show l = print ("[" ^ String.concatWith ", " (map Int.toString l) ^ "]\n")

val () = show (List.take (xs, 2))
val () = show (List.drop (xs, 4))
val (evens, odds) = List.partition (fn x => x mod 2 = 0) xs
val () = show evens
val () = show odds
val () = print (case List.find (fn x => x > 7) xs of SOME v => Int.toString v ^ "\n" | NONE => "none\n")
val () = print (Bool.toString (List.exists (fn x => x = 9) xs) ^ "\n")
val () = print (Bool.toString (List.all (fn x => x > 0) xs) ^ "\n")
val () = show (List.tabulate (5, fn i => i * i))
val () = print (Int.toString (List.nth (xs, 3)) ^ "\n")
val () = show (List.concat [[1, 2], [3], [], [4, 5]])
val () = show (List.mapPartial (fn x => if x > 4 then SOME (x * 10) else NONE) xs)
val () = print (Int.toString (List.length (List.filter (fn x => x < 5) xs)) ^ "\n")
val () = show (List.rev (List.take (xs, 3)))
val () = print (Int.toString (foldl Int.max (hd xs) xs) ^ "\n")
val () = show (List.last xs :: List.tl (List.take (xs, 3)))
val () = print (Bool.toString (null (List.drop (xs, 6))) ^ "\n")
