fun ext_gcd (a, 0) = (a, 1, 0)
  | ext_gcd (a, b) =
      let
        val (g, x1, y1) = ext_gcd (b, a mod b)
      in
        (g, y1, x1 - (a div b) * y1)
      end

val (g, x, y) = ext_gcd (35, 15)
val () = print ("gcd=" ^ Int.toString g ^ " x=" ^ Int.toString x ^ " y=" ^ Int.toString y ^ "\n")
val () = print (Bool.toString (35 * x + 15 * y = g) ^ "\n")
