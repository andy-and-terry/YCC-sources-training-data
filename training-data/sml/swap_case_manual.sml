fun swapChar c =
  if Char.isUpper c then Char.toLower c else Char.toUpper c

fun swapCase s = String.map swapChar s

val () = print (swapCase "Hello World 42" ^ "\n")
