fun countChar c s = length (List.filter (fn x => x = c) (String.explode s))

val text = String.map Char.toLower "Education is beautiful"

val () =
  app (fn v => print (String.str v ^ "=" ^ Int.toString (countChar v text) ^ " "))
      (String.explode "aeiou")
val () = print "\n"
