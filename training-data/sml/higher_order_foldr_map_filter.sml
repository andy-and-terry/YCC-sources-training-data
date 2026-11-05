val xs = [1, 2, 3, 4, 5, 6]
val sq = map (fn x => x * x) xs
val ev = List.filter (fn x => x mod 2 = 0) xs
val total = foldr (op +) 0 xs
val _ = app (fn x => print (Int.toString x ^ " ")) (sq @ ev @ [total])
val _ = print "\n"
