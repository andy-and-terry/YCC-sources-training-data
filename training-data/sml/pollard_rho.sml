fun gcd (a, 0) = a
  | gcd (a, b) = gcd (b, a mod b)

fun rho n =
  if n mod 2 = 0 then 2
  else
    let
      fun f v = (v * v + 1) mod n
      fun loop (x, y) =
        let val x1 = f x
            val y1 = f (f y)
            val d = gcd (abs (x1 - y1), n)
        in if d = 1 then loop (x1, y1) else d end
    in loop (2, 2) end

val n = 8051
val p = rho n
val () = print (Int.toString n ^ " = " ^ Int.toString p ^ " * " ^ Int.toString (n div p) ^ "\n")
