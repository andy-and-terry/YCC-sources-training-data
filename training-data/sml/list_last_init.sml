fun last [x] = x
  | last (_ :: xs) = last xs
  | last [] = raise Empty

fun init [_] = []
  | init (x :: xs) = x :: init xs
  | init [] = raise Empty

val xs = [10, 20, 30, 40]
val () = print (Int.toString (last xs) ^ "\n")
val () = print (String.concatWith "," (map Int.toString (init xs)) ^ "\n")
val () = print ((Int.toString (last [])) handle Empty => "empty list")
val () = print "\n"
