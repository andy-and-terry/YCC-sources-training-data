fun safe_divide (a, 0) = NONE
  | safe_divide (a, b) = SOME (a div b)

fun safe_divide_chain (a, b, c) =
  case safe_divide (a, b) of
    NONE => NONE
  | SOME result => safe_divide (result, c)

val () =
  case safe_divide_chain (100, 5, 2) of
    SOME v => print (Int.toString v ^ "\n")
  | NONE => print "none\n"

val () =
  case safe_divide_chain (100, 0, 2) of
    SOME v => print (Int.toString v ^ "\n")
  | NONE => print "none\n"
