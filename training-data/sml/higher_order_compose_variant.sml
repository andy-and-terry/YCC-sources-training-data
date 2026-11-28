fun compose f g = fn x => f (g x)
val inc = fn x => x + 1
val dbl = fn x => x * 2

val _ = print (Int.toString ((compose inc dbl) 5) ^ "\n")
val _ = print (Int.toString ((compose dbl inc) 5) ^ "\n")
