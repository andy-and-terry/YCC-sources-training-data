exception Empty
fun head [] = raise Empty
  | head (x :: _) = x
val r = head [] handle Empty => ~1
val _ = print (Int.toString r ^ "\n")
