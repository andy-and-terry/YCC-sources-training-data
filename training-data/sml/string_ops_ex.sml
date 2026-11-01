val s = "Hello, SML"
val () = print (String.map Char.toUpper s ^ "\n")
val () = print (Int.toString (String.size s) ^ "\n")
val words = String.tokens (fn c => c = #",") "a,b,,c"
val () = print (String.concatWith "|" words ^ "\n")
val () = print (String.substring (s, 7, 3) ^ " " ^ Int.toString (ord #"A") ^ "\n")
