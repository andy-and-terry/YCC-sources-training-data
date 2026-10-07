val xs = [5, 3, 8, 1, 9, 2]

fun showList l = "[" ^ String.concatWith ", " (map Int.toString l) ^ "]"

val () = print (showList (List.take (xs, 3)) ^ "\n")
val () = print (showList (List.drop (xs, 3)) ^ "\n")
val (evens, odds) = List.partition (fn x => x mod 2 = 0) xs
val () = print (showList evens ^ " " ^ showList odds ^ "\n")
val () = print (showList (List.filter (fn x => x > 4) xs) ^ "\n")
val () = print (Int.toString (List.length xs) ^ "\n")
val () = print (showList (List.rev xs) ^ "\n")
val () = print (showList (List.concat [[1, 2], [3], []]) ^ "\n")
val () = print (case List.find (fn x => x > 7) xs of SOME v => Int.toString v | NONE => "none")
val () = print "\n"
val () = print (Bool.toString (List.exists (fn x => x = 9) xs) ^ " ")
val () = print (Bool.toString (List.all (fn x => x > 0) xs) ^ "\n")
val () = print (showList (List.tabulate (5, fn i => i * i)) ^ "\n")
val () = print (showList (List.mapPartial (fn x => if x > 4 then SOME (x * 2) else NONE) xs) ^ "\n")
val () = print (Int.toString (List.nth (xs, 2)) ^ " " ^ Int.toString (hd xs) ^ " " ^ Int.toString (List.last xs) ^ "\n")
