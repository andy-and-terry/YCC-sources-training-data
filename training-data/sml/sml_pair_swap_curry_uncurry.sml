fun curry f a b = f (a, b)
fun uncurry f (a, b) = f a b
fun swap (a, b) = (b, a)

val addPair = fn (a, b) => a + b
val addCurried = curry addPair
val back = uncurry addCurried

val () = print (Int.toString (addCurried 3 4) ^ "\n")
val () = print (Int.toString (back (5, 6)) ^ "\n")
val (x, y) = swap ("left", "right")
val () = print (x ^ " " ^ y ^ "\n")
