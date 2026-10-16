exception Parse of string

fun parseDigit c =
  if Char.isDigit c then Char.ord c - Char.ord #"0"
  else raise Parse ("not a digit: " ^ str c)

fun parseNumber s =
  List.foldl (fn (c, acc) => acc * 10 + parseDigit c) 0 (String.explode s)

fun attempt s =
  (Int.toString (parseNumber s))
  handle Parse msg => "error (" ^ msg ^ ")"

val () = print (attempt "1234" ^ "\n")
val () = print (attempt "12x4" ^ "\n")
