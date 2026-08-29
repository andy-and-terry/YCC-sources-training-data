fun binary_to_decimal s =
  foldl (fn (c, acc) => acc * 2 + (Char.ord c - Char.ord #"0")) 0 (String.explode s)

val () = print (Int.toString (binary_to_decimal "1011") ^ "\n")
