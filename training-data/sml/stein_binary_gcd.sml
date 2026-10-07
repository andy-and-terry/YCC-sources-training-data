(* Binary GCD (Stein's algorithm) *)
fun steinGcd (a, b) =
  if a = 0 then b
  else if b = 0 then a
  else if a mod 2 = 0 andalso b mod 2 = 0 then 2 * steinGcd (a div 2, b div 2)
  else if a mod 2 = 0 then steinGcd (a div 2, b)
  else if b mod 2 = 0 then steinGcd (a, b div 2)
  else if a >= b then steinGcd ((a - b) div 2, b)
  else steinGcd ((b - a) div 2, a)

val () = print (Int.toString (steinGcd (48, 18)) ^ "\n")
val () = print (Int.toString (steinGcd (270, 192)) ^ "\n")
val () = print (Int.toString (steinGcd (17, 5)) ^ "\n")
