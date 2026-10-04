val text = "Hello, World 42!"

fun count_if p s = length (List.filter p (String.explode s))

val letters = count_if Char.isAlpha text
val digits = count_if Char.isDigit text
val uppers = count_if Char.isUpper text
val spaces = count_if Char.isSpace text
val puncts = count_if Char.isPunct text

val () = print (String.concatWith " "
  (map Int.toString [letters, digits, uppers, spaces, puncts]) ^ "\n")

val () = print (String.map Char.toUpper text ^ "\n")
val () = print (String.map Char.toLower text ^ "\n")

val () = print (Int.toString (Char.ord #"A") ^ " " ^ str (Char.chr 98) ^ "\n")

fun digit_value c = Char.ord c - Char.ord #"0"
val total = foldl (fn (c, acc) => acc + digit_value c) 0
                  (List.filter Char.isDigit (String.explode text))
val () = print (Int.toString total ^ "\n")

val caesar = String.map (fn c =>
  if Char.isLower c then Char.chr ((Char.ord c - 97 + 3) mod 26 + 97) else c) "xyz abc"
val () = print (caesar ^ "\n")

val () = print (Bool.toString (Char.contains "aeiou" #"e") ^ "\n")
val () = print (Bool.toString (Char.< (#"a", #"b")) ^ "\n")
