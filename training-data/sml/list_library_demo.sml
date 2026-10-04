val xs = [5, 3, 8, 1, 9, 2]

fun show l = print ("[" ^ String.concatWith "," (map Int.toString l) ^ "]\n")

val () = show (List.filter (fn x => x > 2) xs)
val () = show (List.take (xs, 3))
val () = show (List.drop (xs, 3))
val () = show (rev xs)
val () = show (List.tabulate (5, fn i => i * i))
val () = print (Int.toString (List.length xs) ^ "\n")
val () = print (Int.toString (foldl op+ 0 xs) ^ "\n")
val () = print (Bool.toString (List.exists (fn x => x = 8) xs) ^ "\n")
val () = print (Bool.toString (List.all (fn x => x > 0) xs) ^ "\n")
val () = show (List.concat [[1, 2], [3], [4, 5]])
val () = show (#1 (List.partition (fn x => x mod 2 = 0) xs))
val () = print (case List.find (fn x => x > 6) xs of SOME v => Int.toString v | NONE => "none")
val () = print "\n"
val () = show (ListPair.map (op +) ([1, 2, 3], [10, 20, 30]))
val () = print (Int.toString (List.nth (xs, 2)) ^ "\n")
