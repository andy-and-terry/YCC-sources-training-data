fun gcd (a, 0) = abs a
  | gcd (a, b) = gcd (b, a mod b)

fun gcdAll nums = foldl (fn (n, acc) => gcd (acc, n)) 0 nums

val () = print (Int.toString (gcdAll [12, 18, 24]) ^ "\n")
val () = print (Int.toString (gcdAll [7, 13]) ^ "\n")
