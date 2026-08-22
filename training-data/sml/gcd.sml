fun gcd (a, 0) = a
  | gcd (a, b) = gcd (b, a mod b)

val () = print (Int.toString (gcd (48, 18)) ^ "\n")
val () = print (Int.toString (gcd (100, 75)) ^ "\n")
