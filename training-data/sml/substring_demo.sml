(* Substring slices avoid copying *)
val s = "  hello, world  "
val ss = Substring.full s
val trimmed = Substring.dropr Char.isSpace (Substring.dropl Char.isSpace ss)

val () = print ("[" ^ Substring.string trimmed ^ "]\n")
val (l, r) = Substring.splitl (fn c => c <> #",") trimmed
val () = print (Substring.string l ^ "\n")
val () = print (Substring.string (Substring.triml 1 r) ^ "\n")
val () = print (Int.toString (Substring.size trimmed) ^ "\n")
val () = print (String.substring ("abcdef", 2, 3) ^ "\n")
val () = print (String.extract ("abcdef", 4, NONE) ^ "\n")
