val xs = [5, 3, 8, 1, 9, 2]
fun show l = print (String.concatWith " " (map Int.toString l) ^ "\n")
val _ = show (List.filter (fn x => x mod 2 = 1) xs)
val _ = show (map (fn x => x * x) xs)
val _ = print (Int.toString (foldl op+ 0 xs) ^ " " ^ Int.toString (foldr (fn (x, a) => x - a) 0 xs) ^ "\n")
val (small, big) = List.partition (fn x => x < 5) xs
val _ = show small
val _ = show big
val _ = show (ListPair.map (op+) ([1, 2, 3], [10, 20, 30]))
val _ = show (List.take (xs, 2) @ List.drop (xs, 4))
val _ = show (rev xs)
val _ = print (Bool.toString (List.exists (fn x => x > 8) xs) ^ " " ^ Bool.toString (List.all (fn x => x > 0) xs) ^ "\n")
val _ = print (Int.toString (length xs) ^ " " ^ Int.toString (List.nth (xs, 2)) ^ "\n")
val SOME m = List.find (fn x => x > 5) xs
val _ = print (Int.toString m ^ "\n")
val _ = show (ListMergeSort.sort (op>) xs)
val _ = show (List.concat [[1], [2, 3], []])
val _ = print (Int.toString (List.foldl Int.max 0 xs) ^ "\n")
