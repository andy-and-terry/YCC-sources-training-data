datatype color = Red | Green | Blue

val all = [Red, Green, Blue]

fun name Red = "red"
  | name Green = "green"
  | name Blue = "blue"

fun next Red = Green
  | next Green = Blue
  | next Blue = Red

val () = List.app (fn c => print (name c ^ " -> " ^ name (next c) ^ "\n")) all
