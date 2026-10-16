fun lookup (key, []) = NONE
  | lookup (key, (k, v) :: rest) = if key = k then SOME v else lookup (key, rest)

val table = [("one", 1), ("two", 2), ("three", 3)]

val () = print (case lookup ("two", table) of SOME v => Int.toString v | NONE => "?")
val () = print "\n"
val () = print (case lookup (#"z", [(#"a", 1)]) of SOME v => Int.toString v | NONE => "missing")
val () = print "\n"
