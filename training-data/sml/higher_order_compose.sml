fun compose f g x = f (g x)
val inc = fn x => x + 1
val dbl = fn x => x * 2
val _ = print (Int.toString (compose inc dbl 5) ^ "\n")
val _ = print (Int.toString (foldl op+ 0 (map dbl [1, 2, 3])) ^ "\n")
