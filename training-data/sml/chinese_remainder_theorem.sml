fun ext_gcd (a, 0) = (a, 1, 0)
  | ext_gcd (a, b) =
      let
        val (g, x1, y1) = ext_gcd (b, a mod b)
      in
        (g, y1, x1 - (a div b) * y1)
      end

fun mod_pos (a, m) =
  let val r = a mod m in if r < 0 then r + m else r end

fun crt (r1, m1, r2, m2) =
  let
    val (g, p, _) = ext_gcd (m1, m2)
  in
    if (r2 - r1) mod g <> 0 then
      NONE
    else
      let
        val lcm = (m1 div g) * m2
        val diff = (r2 - r1) div g
        val x = r1 + m1 * mod_pos (diff * p, m2 div g)
      in
        SOME (mod_pos (x, lcm), lcm)
      end
  end

val () =
  case crt (2, 3, 3, 5) of
    SOME (x, m) => print (Int.toString x ^ " mod " ^ Int.toString m ^ "\n")
  | NONE => print "no solution\n"

val () =
  case crt (1, 4, 2, 6) of
    SOME (x, m) => print (Int.toString x ^ " mod " ^ Int.toString m ^ "\n")
  | NONE => print "no solution\n"
