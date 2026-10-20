val xs = [1, 2, 3, 4]
val total = foldl op+ 0 (map (fn x => x * x) xs)
val _ = print (Int.toString total ^ "\n")
