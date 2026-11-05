val s = "hello"
val r = implode (rev (explode s))
val up = String.map Char.toUpper s
val _ = print (r ^ " " ^ up ^ " " ^ Int.toString (size s) ^ "\n")
val _ = print (String.concatWith "," (String.tokens (fn c => c = #" ") "a b  c") ^ "\n")
