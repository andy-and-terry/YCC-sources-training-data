val s = "Hello, SML World!"

val () = print (String.map Char.toUpper s ^ "\n")
val () = print (String.map Char.toLower s ^ "\n")
val () = print (Int.toString (String.size s) ^ "\n")
