val s = "Hello, SML"
val _ = print (Int.toString (size s) ^ "\n")
val _ = print (String.map Char.toUpper s ^ "\n")
val _ = print (String.substring (s, 0, 5) ^ "\n")
val _ = print (String.concatWith "-" (String.tokens (fn c => c = #" ") "a b c") ^ "\n")
