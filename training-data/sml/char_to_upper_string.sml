fun capitalize s =
  case String.explode s of
    [] => ""
  | c :: cs => String.implode (Char.toUpper c :: map Char.toLower cs)

fun titleCase s =
  String.concatWith " " (map capitalize (String.tokens (fn c => c = #" ") s))

val () = print (titleCase "hELLO wORLD from sml" ^ "\n")
val () = print (String.map Char.toUpper "shout" ^ "\n")
