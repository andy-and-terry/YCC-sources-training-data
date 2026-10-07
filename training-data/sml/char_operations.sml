(* Character classification and conversion *)
val s = "Hello World 123"

fun count p str = List.length (List.filter p (String.explode str))

val () = print (Int.toString (count Char.isAlpha s) ^ "\n")
val () = print (Int.toString (count Char.isDigit s) ^ "\n")
val () = print (Int.toString (count Char.isUpper s) ^ "\n")
val () = print (Int.toString (count Char.isSpace s) ^ "\n")
val () = print (Int.toString (Char.ord #"A") ^ "\n")
val () = print (Char.toString (Char.chr 98) ^ "\n")
val () = print (String.map Char.toUpper "shout" ^ "\n")
val () = print (String.implode (rev (String.explode "stressed")) ^ "\n")
