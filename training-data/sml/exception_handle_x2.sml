exception Empty
fun hd' [] = raise Empty
  | hd' (x :: _) = x
val _ = (hd' ([] : int list); ()) handle Empty => print "empty list\n"
