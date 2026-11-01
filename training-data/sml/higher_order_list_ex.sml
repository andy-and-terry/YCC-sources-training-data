val xs = [1, 2, 3, 4, 5, 6]
val evens = List.filter (fn x => x mod 2 = 0) xs
val squares = List.map (fn x => x * x) xs
val total = List.foldl (op +) 0 xs
val () = print (Int.toString total ^ " " ^ Int.toString (length evens) ^ " " ^ Int.toString (hd squares) ^ "\n")
