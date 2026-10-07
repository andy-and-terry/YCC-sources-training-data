fun add a b = a + b

val add_five = add 5

fun apply_twice f x = f (f x)

val () = print (Int.toString (add_five 10) ^ "\n")
val () = print (Int.toString (apply_twice add_five 1) ^ "\n")

fun compose f g x = f (g x)

val add_one = add 1
val double = fn x => x * 2
val add_one_then_double = compose double add_one

val () = print (Int.toString (add_one_then_double 4) ^ "\n")
