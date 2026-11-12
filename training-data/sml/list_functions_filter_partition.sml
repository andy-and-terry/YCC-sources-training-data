val (ev, od) = List.partition (fn x => x mod 2 = 0) [1, 2, 3, 4, 5]
val _ = print (Int.toString (length ev) ^ Int.toString (length od) ^ "\n")
val _ = print (Int.toString (List.nth ([10, 20, 30], 1)) ^ "\n")
