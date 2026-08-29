fun my_gcd (a, 0) = Int.abs a
  | my_gcd (a, b) = my_gcd (b, a mod b)

fun my_lcm (a, b) = Int.abs (a * b) div my_gcd (a, b)

val () = print (Int.toString (my_gcd (48, 18)) ^ "\n")
val () = print (Int.toString (my_lcm (4, 6)) ^ "\n")
