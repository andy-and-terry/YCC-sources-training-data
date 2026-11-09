val a = foldl (fn (x, acc) => x :: acc) [] [1, 2, 3]
val b = foldr (fn (x, acc) => x :: acc) [] [1, 2, 3]
val _ = print (String.concatWith "," (map Int.toString a) ^ " | " ^ String.concatWith "," (map Int.toString b) ^ "\n")
