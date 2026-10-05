fun shiftChar k c =
  if Char.isLower c then rotate (ord #"a") k c
  else if Char.isUpper c then rotate (ord #"A") k c
  else c
and rotate base k c = chr (base + ((ord c - base + k) mod 26))

fun encrypt k s = String.map (shiftChar k) s

val secret = encrypt 3 "Hello, World!"
val () = print (secret ^ "\n")
val () = print (encrypt ~3 secret ^ "\n")
