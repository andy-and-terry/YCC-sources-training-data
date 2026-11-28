fun affineChar (a, b) ch =
  if Char.isUpper ch then
    let val x = ord ch - ord #"A"
    in chr ((a * x + b) mod 26 + ord #"A") end
  else ch

fun affine (a, b) s = String.map (affineChar (a, b)) s

val () = print (affine (5, 8) "AFFINE" ^ "\n")
