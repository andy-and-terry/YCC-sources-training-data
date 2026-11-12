fun fact n = let fun go (0, acc) = acc | go (k, acc) = go (k - 1, acc * k) in go (n, 1) end
val _ = print (Int.toString (fact 10) ^ "\n")
