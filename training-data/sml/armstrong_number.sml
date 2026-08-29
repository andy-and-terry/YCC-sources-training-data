fun digits n =
  if n < 10 then [n] else digits (n div 10) @ [n mod 10]

fun is_armstrong n =
  let
    val ds = digits n
    val power = length ds
    val total = foldl (fn (d, acc) => acc + Real.round (Math.pow (real d, real power))) 0 ds
  in
    total = n
  end

val () = print (Bool.toString (is_armstrong 153) ^ "\n")
val () = print (Bool.toString (is_armstrong 154) ^ "\n")
